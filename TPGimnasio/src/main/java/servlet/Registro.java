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
import javax.servlet.http.HttpSession;

import entities.Plan;
import entities.Rutina;
import entities.Usuario;
import logic.PlanesLogic;
import logic.UsuarioLogic;

/**
 * Servlet implementation class Registro
 */
@WebServlet({ "/Registro", "/REGISTRO", "/registro" })
public class Registro extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Registro() {
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
		if(request.getParameter("idUserLogin")!=null) {
			String idUserLogin = request.getParameter("idUserLogin");
			Usuario userLogin =ctrlUsu.getById(Integer.parseInt(idUserLogin));
			request.getSession().setAttribute("usuarioLogin", userLogin);
		}
		
		String name = request.getParameter("name");
		String surname = request.getParameter("surname");
		String telephone = request.getParameter("telephone");
		String tipoDoc = request.getParameter("selectTipoDoc");
		String dni = request.getParameter("dni");
		String sex = request.getParameter("selectGenero");
		String email = request.getParameter("dni");
		String direccion = request.getParameter("direccion");
		String fechaNacString = request.getParameter("fechaNacimiento");
		String username = request.getParameter("username");
		String password = request.getParameter("password");
		String password2 = request.getParameter("passwordTwo");
		String[] planes =request.getParameterValues("planes");
		UsuarioLogic usuarioLogic = new UsuarioLogic();
		if (usuarioLogic.validarContrasenias(password, password2)) {
			Usuario user = new Usuario();
			user.setNombre(name);
			user.setApellido(surname);
			user.setTelefono(telephone);
			user.setTipo_doc(tipoDoc);
			user.setDni(dni);
			user.setEmail(email);
			user.setGenero(sex);
			user.setUsername(username);
			user.setContrasenia(password);
			user.setDireccion(direccion);
			DateTimeFormatter dateFormat = DateTimeFormatter.ofPattern("yyyy-MM-dd");
		    LocalDate fechaNac = LocalDate.parse(fechaNacString, dateFormat);
			user.setFecha_nacimiento(fechaNac);
			user.setRol(usuarioLogic.setRol(3));
			//Planes
			for (int i = 0; i < planes.length; i++) {
				Plan plan= new Plan();
				plan.setId_plan(Integer.parseInt(planes[i]));
				user.setPlanes(plan);
			}
			
			try {
				usuarioLogic.altaUser(user);
				PlanesLogic pl = new PlanesLogic();
				for (Plan pla : user.getPlanes()) {
					pl.addUsuarioPlan(user.getId_usuario(), pla.getId_plan());
				}
				if(request.getSession().getAttribute("usuarioLogin")!=null) {
					LinkedList<Usuario> users = ctrlUsu.getAll();
					request.setAttribute("listaUsuarios", users);
					request.getRequestDispatcher("WEB-INF/UsersList.jsp").forward(request, response);
				}
				else {
					request.getRequestDispatcher("index.html").forward(request, response);
				}
				
				
				
			} catch (Exception e) {
				String msg=e.getMessage();
				response.getWriter().append("Error ").append(msg);
			}
			
		}
		else {
			request.setAttribute("mensaje", "Las contraseñas ingresadas son diferentes.");
			request.getRequestDispatcher("registro.jsp").forward(request, response);
		}
		
	
	}

}
