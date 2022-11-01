package servlet;

import java.io.IOException;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import entities.Instructor;
import entities.Rutina;
import entities.Usuario;
import logic.RutinaLogic;
import logic.UsuarioLogic;

/**
 * Servlet implementation class ABMCRutina
 */
@WebServlet("/ABMCRutina")
public class ABMCRutina extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ABMCRutina() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		// response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		UsuarioLogic ctrlUsu = new UsuarioLogic();
		RutinaLogic ctrlRut = new RutinaLogic();
		
		String bandera = "";
		String opcion = request.getParameter("optionBM");
		Rutina r;
		
		String idUserLogin = request.getParameter("idUserLogin");
		Usuario userLogin =ctrlUsu.getById(Integer.parseInt(idUserLogin));
		request.getSession().setAttribute("usuarioLogin", userLogin);
		
		
		if(!opcion.equalsIgnoreCase("alta")) {
			String idRut = request.getParameter("idRutina");
			r =ctrlRut.getById(Integer.parseInt(idRut));
			request.setAttribute("rutina", r);
		}
		else {
			 r = new Rutina();
			request.setAttribute("rutina", r);
		}		
		
		
		switch(opcion) {
		
		case "alta":
			bandera=request.getParameter("bandera");
			if(bandera.equalsIgnoreCase("aAñadir")) {
				request.getRequestDispatcher("WEB-INF/altaRutina.jsp").forward(request, response);
			}
			else {
				int id_rutina = Integer.parseInt(request.getParameter("id"));
				String nombre = request.getParameter("nombre");
				String semanas = request.getParameter("semanas");
				String nivel = request.getParameter("nivel");
				String comentario = request.getParameter("comentario");
			
				Rutina rut = new Rutina();
				rut.setId_rutina(id_rutina);
				rut.setNombre(nombre);
				rut.setSemanas(semanas);
				rut.setNivel(nivel);
				rut.setComentario(comentario);
				
				try {
					ctrlRut.altaRutina(rut);
					request.setAttribute("mensaje", "Rutina añadido satisfactoriamente.");
					request.getRequestDispatcher("WEB-INF/listaRutina.jsp").forward(request, response);
						
				} catch (Exception e) {
					String msg=e.getMessage();
					response.getWriter().append("Error ").append(msg);
				}
			}
		break;
			
		case "modificacion":
			// se debe devolver una bandera? Eso no lo entendí bien
			bandera=request.getParameter("bandera");
			if (bandera.equalsIgnoreCase("aModificar")) {
				request.getRequestDispatcher("WEB-INF/updateRutina.jsp").forward(request, response);
			}
			else {
				int id_rutina = Integer.parseInt(request.getParameter("id"));
				String nombre = request.getParameter("nombre");
				String semanas = request.getParameter("semanas");
				String nivel = request.getParameter("nivel");
				String comentario = request.getParameter("comentario");
				
				r.setId_rutina(id_rutina);
				r.setNombre(nombre);
				r.setSemanas(semanas);
				r.setNivel(nivel);
				r.setComentario(comentario);	
				
				ctrlRut.modifyRutina(r);
				
				request.setAttribute("mensaje", "Rutina modificada satisfactoriamente.");
				request.getRequestDispatcher("WEB-INF/listaRutina.jsp").forward(request, response);
			}
		break;
		
		case "baja":
			int cant = ctrlRut.bajaRutina(r);
			if (cant > 0) {
				request.setAttribute("mensaje", "No se puede eliminar la rutina, porque está dentro de "+cant+" plan/es.");
			}
			else {
				request.setAttribute("mensaje", "Rutina eliminada satisfactoriamente.");
			}
			request.getRequestDispatcher("WEB-INF/listaRutina.jsp").forward(request, response);
		break;
		
		}		
	}

}
