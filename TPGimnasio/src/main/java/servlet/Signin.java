package servlet;

import java.io.IOException;
import java.util.LinkedList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import entities.*;
import logic.*;

/**
 * Servlet implementation class Signin
 */
@WebServlet({ "/Signin", "/SIGNIN", "/signin", "/signIn", "/SignIn" })
public class Signin extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Signin() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		if(request.getSession().getAttribute("usuarioLogin")!=null) {
			request.getRequestDispatcher("WEB-INF/UserManagement.jsp").forward(request, response);
		}
		else {
			request.getRequestDispatcher("signin.jsp").forward(request, response);
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		Usuario user = new Usuario();
		UsuarioLogic usuarioLogic = new UsuarioLogic();
		
		String username = request.getParameter("username");
		String password = request.getParameter("password");
		
		user.setUsername(username);
		user.setContrasenia(password);
		
		user=usuarioLogic.validarLoginUsuario(user);
		
		if(user!=null) {
			
//			LinkedList<Usuario> users = usuarioLogic.getAll();
			//LinkedList<Grupo_Musculo> grupo_musculo=usuarioLogic.get
			
			request.getSession().setAttribute("usuarioLogin", user);
//			request.setAttribute("listaUsuarios", users);
			
			request.getRequestDispatcher("WEB-INF/UserManagement.jsp").forward(request, response);
		}
		else {
			request.setAttribute("mensaje", "El usuario y/o contraseña ingresados son incorrectos.");
			request.getRequestDispatcher("signin.jsp").forward(request, response);
		}
		
		
//		response.getWriter().append("Bienvenido ").append(user.getNombre()).append(" ")
//		.append(user.getApellido());
		
	}

}
