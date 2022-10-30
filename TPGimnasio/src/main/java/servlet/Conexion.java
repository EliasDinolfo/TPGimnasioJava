package servlet;

import java.io.IOException;
import java.util.LinkedList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import entities.Instructor;
import entities.Usuario;
import logic.InstructorLogic;
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
		
//		Usuario u =ctrlUsu.getById(Integer.parseInt(idUser));
		Usuario userLogin =ctrlUsu.getById(Integer.parseInt(idUserLogin));
		
		request.getSession().setAttribute("usuarioLogin", userLogin);
		
		switch (opcion) {
		case "firstlog": {
			LinkedList<Usuario> users = ctrlUsu.getAll();
			request.setAttribute("listaUsuarios", users);
			request.getRequestDispatcher("WEB-INF/UsersList.jsp").forward(request, response);
		}
		case "instructores":
			InstructorLogic ctrlIns = new InstructorLogic();
			LinkedList<Instructor> instructores = ctrlIns.getAll();
			request.setAttribute("listaInstructores", instructores);
			request.getRequestDispatcher("WEB-INF/InstructoresList.jsp").forward(request, response);
		default:
			throw new IllegalArgumentException("Unexpected value: " + opcion);
		}

		
	}

}
