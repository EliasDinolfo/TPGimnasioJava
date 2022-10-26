package servlet;

import java.io.IOException;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import entities.Usuario;
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
			
			try {
				usuarioLogic.altaUser(user);
				
				request.getSession().setAttribute("usuario", user);
				
				request.getRequestDispatcher("WEB-INF/successfullSignUp.jsp").forward(request, response);
				
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
