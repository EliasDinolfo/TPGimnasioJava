package servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import entities.Ejercicio;
import entities.Usuario;
import logic.EjercicioLogic;
import logic.UsuarioLogic;

/**
 * Servlet implementation class ABMCEjercicio
 */
@WebServlet("/ABMCEjercicio")
public class ABMCEjercicio extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ABMCEjercicio() {
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
		EjercicioLogic ctrlEj = new EjercicioLogic();
		
		String bandera = "";
		String opcion = request.getParameter("optionBM");
		Ejercicio ej;
		
		String idUserLogin = request.getParameter("idUserLogin");
		Usuario userLogin =ctrlUsu.getById(Integer.parseInt(idUserLogin));
		request.getSession().setAttribute("usuarioLogin", userLogin);
		
		
		if(!opcion.equalsIgnoreCase("alta")) {
			String idRut = request.getParameter("idEjercicio");
			ej =ctrlEj.getById(Integer.parseInt(idRut));
			request.setAttribute("ejercicio", ej);
		}
		else {
			 ej = new Ejercicio();
			request.setAttribute("ejercicio", ej);
		}		
		
		
		switch(opcion) {
		
		case "alta":
			bandera=request.getParameter("bandera");
			if(bandera.equalsIgnoreCase("aAñadir")) {
				request.getRequestDispatcher("WEB-INF/altaEjercicio.jsp").forward(request, response);
			}
			else {
				String nombre = request.getParameter("nombre");
				String comentario = request.getParameter("comentario");
				String imagen = request.getParameter("imagen");
				String video = request.getParameter("video");
			
				Ejercicio eje = new Ejercicio();
				eje.setNombre(nombre);
				eje.setComentario(comentario);
				eje.setImagen(imagen);
				eje.setVideo(video);
				
				try {
					ctrlEj.altaEjercicio(eje);
					request.setAttribute("mensaje", "Ejercicio añadido satisfactoriamente.");
					request.getRequestDispatcher("WEB-INF/listaEjercicio.jsp").forward(request, response);
						
				} catch (Exception e) {
					String msg=e.getMessage();
					response.getWriter().append("Error ").append(msg);
				}
			}
		break;
			
		case "modificacion":
			bandera=request.getParameter("bandera");
			if (bandera.equalsIgnoreCase("aModificar")) {
				request.getRequestDispatcher("WEB-INF/updateEjercicio.jsp").forward(request, response);
			}
			else {
				int id_ejercicio = Integer.parseInt(request.getParameter("id"));
				String nombre = request.getParameter("nombre");
				String comentario = request.getParameter("comentario");
				String imagen = request.getParameter("imagen");
				String video = request.getParameter("video");
				
				ej.setId_ejercicio(id_ejercicio);
				ej.setNombre(nombre);
				ej.setComentario(comentario);
				ej.setImagen(imagen);
				ej.setVideo(video);
				
				ctrlEj.modifyEjercicio(ej);
				
				request.setAttribute("mensaje", "Ejercicio modificado satisfactoriamente.");
				request.getRequestDispatcher("WEB-INF/listaEjercicio.jsp").forward(request, response);
			}
		break;
		
		case "baja":
			int cant = ctrlEj.bajaEjercicio(ej);
			if (cant > 0) {
				request.setAttribute("mensaje", "No se puede eliminar el ejercicio, porque está incluido en "+cant+" grupo músculo y/o rutinas");
			}
			else {
				request.setAttribute("mensaje", "Ejercicio eliminado satisfactoriamente.");
			}
			request.getRequestDispatcher("WEB-INF/listaEjercicio.jsp").forward(request, response);
		break;
		
		}
	}

}
