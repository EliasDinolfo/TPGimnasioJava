package servlet;

import java.io.IOException;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
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
		
		
//		UsuarioLogic ctrlUsu= new UsuarioLogic();
//		
//		
//		//String idUser = request.getParameter("idUser");
//		String idUserLogin = request.getParameter("idUserLogin");
//		
//		//u=ctrlUsu.getById(Integer.parseInt(idUser));
//		Usuario userLogin =ctrlUsu.getById(Integer.parseInt(idUserLogin));
//		
//		LinkedList<Usuario> users = ctrlUsu.getAll();
//
//		request.getSession().setAttribute("usuarioLogin", userLogin);
//		request.setAttribute("listaUsuarios", users);
//			
//		
//		
//		 RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/WEB-INF/AdminManagement.jsp");
//	     dispatcher.forward(request, response);
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
//		Usuario u = new Usuario();
		UsuarioLogic ctrlUsu= new UsuarioLogic();
		
		
		String bandera="";
		String opcion = request.getParameter("optionBM");
		Usuario u ;
		
		
		String idUserLogin = request.getParameter("idUserLogin");
		
		
		Usuario userLogin =ctrlUsu.getById(Integer.parseInt(idUserLogin));
		
		request.getSession().setAttribute("usuarioLogin", userLogin);
		
		
		if(!opcion.equalsIgnoreCase("alta")) {
			String idUser = request.getParameter("idUser");
			u =ctrlUsu.getById(Integer.parseInt(idUser));
			request.setAttribute("usuario", u);
		}else {
			 u = new Usuario();
			request.setAttribute("usuario", u);
		}
		
		
		switch (opcion) {
		case "alta":
			
			request.getRequestDispatcher("WEB-INF/altaEncargado.jsp").forward(request, response);
		break;
		
		case "modificacion":
			//devolver una bandera q primero rediriga a modificar el user y una vez q fue hecho que se haga el update
			bandera=request.getParameter("bandera");
			
			if (bandera.equalsIgnoreCase("aModificar")) {
				request.getRequestDispatcher("WEB-INF/updateClient.jsp").forward(request, response);
			}else {
				
				
				
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
				
				if (ctrlUsu.validarContrasenias(password, password2)) {
					
					u.setNombre(name);
					u.setApellido(surname);
					u.setTelefono(telephone);
					u.setTipo_doc(tipoDoc);
					u.setDni(dni);
					u.setEmail(email);
					u.setGenero(sex);
					u.setUsername(username);
					u.setContrasenia(password);
					u.setDireccion(direccion);
					DateTimeFormatter dateFormat = DateTimeFormatter.ofPattern("yyyy-MM-dd");
				    LocalDate fechaNac = LocalDate.parse(fechaNacString, dateFormat);
					u.setFecha_nacimiento(fechaNac);
					
				}
				
				ctrlUsu.modifyUser(u);
				request.setAttribute("usuario", u);
				request.getRequestDispatcher("WEB-INF/abmcExitoso.jsp").forward(request, response);
			}
				
			break;

		case "baja":
				ctrlUsu.bajaUser(u);
				request.getRequestDispatcher("WEB-INF/abmcExitoso.jsp").forward(request, response);
			break;
		}
		
		
		//response.getWriter().append("POST de servlet abmc ").append(u.getUsername()).append(" ").append(opcion);
	}

}
