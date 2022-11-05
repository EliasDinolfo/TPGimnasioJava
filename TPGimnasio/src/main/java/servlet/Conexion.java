package servlet;

import java.io.IOException;
import java.util.LinkedList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import entities.Ejercicio;
import entities.Instructor;
import entities.Plan;
import entities.Rutina;
import entities.Usuario;
import logic.EjercicioLogic;
import logic.InstructorLogic;
import logic.PlanesLogic;
import logic.RutinaLogic;
import logic.UsuarioLogic;

/**
 * Servlet implementation class Conexion
 */
@WebServlet("/Conexion")
public class Conexion extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Conexion() {
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
		
		UsuarioLogic ctrlUsu= new UsuarioLogic();
//		String bandera="";
		String opcion = request.getParameter("optionBM");
//		String idUser = request.getParameter("idUser");
		String idUserLogin = request.getParameter("idUserLogin");
		String posible;
//		Usuario u =ctrlUsu.getById(Integer.parseInt(idUser));
		Usuario userLogin =ctrlUsu.getById(Integer.parseInt(idUserLogin));
		
		request.getSession().setAttribute("usuarioLogin", userLogin);
		
		switch (opcion) {
		case "firstlog": {
			LinkedList<Usuario> users = ctrlUsu.getAll();
			request.setAttribute("listaUsuarios", users);
			request.getRequestDispatcher("WEB-INF/UsersList.jsp").forward(request, response);
			break;
		}
		case "instructores":
			InstructorLogic ctrlIns = new InstructorLogic();
			LinkedList<Instructor> instructores = ctrlIns.getAll();
			request.setAttribute("listaInstructores", instructores);
			request.getRequestDispatcher("WEB-INF/InstructoresList.jsp").forward(request, response);
			break;
		case "rutinas":
			RutinaLogic ctrlRut = new RutinaLogic();
			LinkedList<Rutina> rutinas = ctrlRut.getAll();
			request.setAttribute("listaRutina", rutinas);
			request.getRequestDispatcher("WEB-INF/listaRutina.jsp").forward(request, response);
			break;
			
		case "planes":
		
			PlanesLogic ctrlPlan = new PlanesLogic();
			LinkedList<Plan> planes = ctrlPlan.getAll();
			request.setAttribute("listaPlanes", planes);
			
			
			 posible=request.getParameter("alta");
			if(posible.equalsIgnoreCase("altadeplan")) {
				request.setAttribute("mensaje", "Alta de plan exitoso");
				request.setAttribute("color", "primary");
			}
			
			request.getRequestDispatcher("WEB-INF/PlanList.jsp").forward(request, response);
			
			break;
		case "ejercicios":
			EjercicioLogic ctrlEje = new EjercicioLogic();
			LinkedList<Ejercicio> ejercicios = ctrlEje.getAll();
			request.setAttribute("listaEjercicios", ejercicios);
			request.getRequestDispatcher("WEB-INF/listaEjercicio.jsp").forward(request, response);
			break;
			
		default:
			throw new IllegalArgumentException("Unexpected value: " + opcion);
		}

		
	}

}
