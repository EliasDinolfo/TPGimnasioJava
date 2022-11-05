package servlet;

import java.io.IOException;
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
 * Servlet implementation class InscripcionPlan
 */
@WebServlet("/InscripcionPlan")
public class InscripcionPlan extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public InscripcionPlan() {
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
		
		int idPlan = Integer.parseInt(request.getParameter("idPlan"));
		int idUsu = Integer.parseInt(request.getParameter("idUserLogin"));
		
		ctrlPlan.addUsuarioPlan(idUsu, idPlan);
		
		Plan p = ctrlPlan.getById(idPlan);
		
		request.setAttribute("plan", p);
		request.getRequestDispatcher("WEB-INF/inscripcionExitosa.jsp").forward(request, response);
	}

}
