package servlet;

import java.io.IOException;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.LinkedList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import entities.Plan;
import entities.Usuario;
import logic.PlanesLogic;
import logic.UsuarioLogic;

/**
 * Servlet implementation class ABMCPlan
 */
@WebServlet("/ABMCPlan")
public class ABMCPlan extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ABMCPlan() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		PlanesLogic ctrlPlan= new PlanesLogic();
		UsuarioLogic ctrlUsu = new UsuarioLogic();
		
		String bandera="";
		String opcion = request.getParameter("optionBM");
		Plan p;
		
		String idUserLogin = request.getParameter("idUserLogin");
		Usuario userLogin =ctrlUsu.getById(Integer.parseInt(idUserLogin));		
		request.getSession().setAttribute("usuarioLogin", userLogin);
		
		LinkedList<Plan> planes = ctrlPlan.getAll();
		request.setAttribute("listaPlanes", planes);
		
		if(!opcion.equalsIgnoreCase("alta")) {
//			String idUser = request.getParameter("idUser");
//			u =ctrlUsu.getById(Integer.parseInt(idUser));
//			request.setAttribute("usuario", u);
	
			String idPlan = request.getParameter("idPlan");
			
			 p =ctrlPlan.getById(Integer.parseInt(idPlan));
			request.setAttribute("plan", p);
			
		}else {
			 p = new Plan();
			 request.setAttribute("plan", p);
		}
		
		
		
		
		switch (opcion) {
		case "alta":
			request.getRequestDispatcher("WEB-INF/altaPlan.jsp").forward(request, response);
			break;
		
		case "modificacion":
			bandera=request.getParameter("bandera");
			
			if (bandera.equalsIgnoreCase("aModificar")) {
				request.getRequestDispatcher("WEB-INF/updatePlan.jsp").forward(request, response);
			}else {
				
				
				
				String nombre = request.getParameter("nombre");
				String descripcion = request.getParameter("descripcion");
				String fechaExpiracion = request.getParameter("fechaExpiracion");
				
					
					p.setNombre(nombre);
					p.setDescripcion(descripcion);
					DateTimeFormatter dateFormat = DateTimeFormatter.ofPattern("yyyy-MM-dd");
					LocalDate fechaExp = LocalDate.parse(fechaExpiracion, dateFormat);
					p.setFecha_expiracion(fechaExp);
				
				
				ctrlPlan.modifyPlan(p);
				request.setAttribute("plan", p);
				request.getRequestDispatcher("WEB-INF/UserManagement.jsp").forward(request, response);
			}
				
			break;
		case "consulta":
			
//			request.getRequestDispatcher("WEB-INF/consulta.jsp").forward(request, response);
			request.setAttribute("mensaje", "Presionaste consulta. A completar");
			request.getRequestDispatcher("WEB-INF/PlanList.jsp").forward(request, response);
			break;
		case "baja":
//				ctrlPlan.bajaPlan(p);
				
				request.setAttribute("mensaje", "La opcion 'Eliminar' esta desactivada por el momento. Intente nuevamente mas tarde.");
				request.getRequestDispatcher("WEB-INF/PlanList.jsp").forward(request, response);
			break;
		}
		
		
		
		
		
	}

}
