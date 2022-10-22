package servlet;

import java.io.IOException;
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
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		Usuario u = new Usuario();
		UsuarioLogic ctrlUsu= new UsuarioLogic();
		
		
		
		String opcion = request.getParameter("eliminar");
		String idUser = request.getParameter("idUser");
		
		u=ctrlUsu.getById(Integer.parseInt(idUser));
		
		
		response.getWriter().append("POST de servlet abmc ").append(u.getUsername());
	}

}
