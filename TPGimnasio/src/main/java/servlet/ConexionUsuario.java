package servlet;

import java.io.IOException;
import java.util.LinkedList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import entities.Usuario;
import entities.Cuota;
import entities.Plan;
import logic.UsuarioLogic;
import logic.CuotaLogic;
import logic.PlanesLogic;

/**
 * Servlet implementation class ConexionUsuario
 */
@WebServlet("/ConexionUsuario")
public class ConexionUsuario extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ConexionUsuario() {
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
		String opcion = request.getParameter("optionBM");
		String idUserLogin = request.getParameter("idUserLogin");
		Usuario userLogin =ctrlUsu.getById(Integer.parseInt(idUserLogin));
		
		request.getSession().setAttribute("usuarioLogin", userLogin);
		
		switch(opcion){
		case "inscripcionPlan":
			PlanesLogic ctrlPl = new PlanesLogic();
			LinkedList<Plan> planes = ctrlPl.getPlanesDisponibles(userLogin);
			request.setAttribute("listaPlanes", planes);
			request.getRequestDispatcher("WEB-INF/listaPlanesParaUsuario.jsp").forward(request, response);
			break;
		case "cuota":
			//CuotaLogic ctrlCuota = new CuotaLogic();
			//LinkedList<Cuota> cuotas = ctrlCuota.getAllPorUsuario(userLogin);
			//request.setAttribute("listaCuotas", cuotas);
				request.getRequestDispatcher("WEB-INF/listaCuotasParaUsuario.jsp").forward(request, response);
			break;
		default:
			throw new IllegalArgumentException("Unexpected value: " + opcion);
		}
		
	}
}
	
