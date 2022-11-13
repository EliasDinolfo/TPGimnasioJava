package servlet;

import java.io.IOException;
import java.time.LocalDate;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import entities.Cuota;
import entities.Ejercicio;
import entities.Usuario;
import logic.CuotaLogic;
import logic.EjercicioLogic;
import logic.UsuarioLogic;

/**
 * Servlet implementation class ABMCCuota
 */
@WebServlet("/ABMCCuota")
public class ABMCCuota extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ABMCCuota() {
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
		UsuarioLogic ctrlUsu = new UsuarioLogic();
		CuotaLogic ctrlCuota = new CuotaLogic();
		
		String bandera = "";
		String opcion = request.getParameter("optionBM");
		Usuario usuario;
		Cuota cuota;
		
		String idUserLogin = request.getParameter("idUserLogin");
		Usuario userLogin =ctrlUsu.getById(Integer.parseInt(idUserLogin));
		request.getSession().setAttribute("usuarioLogin", userLogin);
		int idUsuario = Integer.parseInt(request.getParameter("idUsuario"));
		String fechaVencimiento= request.getParameter("fechaVencimiento");
		cuota =ctrlCuota.getByIdUsuarioFechaVencimiento(idUsuario,fechaVencimiento);
		request.setAttribute("cuota", cuota);
		
		switch(opcion) {
		case "modificacion":
			bandera=request.getParameter("bandera");
			if (bandera.equalsIgnoreCase("aModificar")) {
				request.getRequestDispatcher("WEB-INF/updateCuota.jsp").forward(request, response);
			}
			else {
				int id_usuario = Integer.parseInt(request.getParameter("idUsuario"));
				String fecha_vencimiento = request.getParameter("fechaVencimiento");
				UsuarioLogic ul = new UsuarioLogic();
				Usuario user=ul.getById(id_usuario);
				cuota.setUsuario(user);
				cuota.setFecha_pago(LocalDate.parse(fecha_vencimiento));
				ctrlCuota.setPagoCuota(cuota);
				if(request.getParameter("grupo1").equalsIgnoreCase("mercadopago"))
					cuota.setForma_pago("mercadopago");
				else {
					cuota.setForma_pago("Tarjeta Crédito/Débito");
				}
				
				ctrlCuota.setPagoCuota(cuota);
				
				request.setAttribute("mensaje", "Pago asignado a la cuota.");
				request.setAttribute("color","alert alert-success");
				if(userLogin.getRol().getId_rol()==3) {
					request.getRequestDispatcher("WEB-INF/listaCuotasParaUsuario.jsp").forward(request, response);
				}else {
					request.setAttribute("idFila", cuota.getUsuario().getId_usuario()+String.valueOf(cuota.getFecha_vencimiento()));
					request.getRequestDispatcher("WEB-INF/CuotaList.jsp").forward(request, response);
				}
				
			}
		break;
		
		}
	}

}
