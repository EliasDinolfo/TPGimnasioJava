package servlet;

import java.io.IOException;
import java.util.LinkedList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import entities.Usuario;
import logic.UsuarioLogic;

/**
 * Servlet implementation class ABMCUsuario
 */
@WebServlet({ "/ABMCUsuario", "/abmcusuario", "/ABMCusuario", "/AbmcUsuario", "/abmcUsuario" })
public class ABMCUsuario extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ABMCUsuario() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
		UsuarioLogic ctrlUsu= new UsuarioLogic();
		
		
		//String idUser = request.getParameter("idUser");
		String idUserLogin = request.getParameter("idUserLogin");
		
		//u=ctrlUsu.getById(Integer.parseInt(idUser));
		Usuario userLogin =ctrlUsu.getById(Integer.parseInt(idUserLogin));
		
		LinkedList<Usuario> users = ctrlUsu.getAll();

		request.getSession().setAttribute("usuarioLogin", userLogin);
		request.setAttribute("listaUsuarios", users);
			
		
		
		 RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/WEB-INF/AdminManagement.jsp");
	     dispatcher.forward(request, response);
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
//		Usuario u = new Usuario();
		UsuarioLogic ctrlUsu= new UsuarioLogic();
		
		
		
		String opcion = request.getParameter("optionBM");
		String idUser = request.getParameter("idUser");
		String idUserLogin = request.getParameter("idUserLogin");
		
		Usuario u =ctrlUsu.getById(Integer.parseInt(idUser));
		Usuario userLogin =ctrlUsu.getById(Integer.parseInt(idUserLogin));
		
		request.getSession().setAttribute("usuarioLogin", userLogin);
		request.setAttribute("usuario", u);
		
		
		switch (opcion) {
		case "modificacion":
				request.getRequestDispatcher("WEB-INF/abmcExitoso.jsp").forward(request, response);;
			break;

		case "baja":
				ctrlUsu.bajaUser(u);
				request.getRequestDispatcher("WEB-INF/abmcExitoso.jsp").forward(request, response);
			break;
		}
		
		
		//response.getWriter().append("POST de servlet abmc ").append(u.getUsername()).append(" ").append(opcion);
	}

}
