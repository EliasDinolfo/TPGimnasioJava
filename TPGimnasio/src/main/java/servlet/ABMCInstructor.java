package servlet;

import java.io.IOException;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;

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
 * Servlet implementation class ABMCInstructor
 */
@WebServlet("/ABMCInstructor")
public class ABMCInstructor extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ABMCInstructor() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		request.getRequestDispatcher("WEB-INF/InstructoresList.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		UsuarioLogic ctrlUsu= new UsuarioLogic();
		InstructorLogic ctrlIns = new InstructorLogic();
		
		String bandera="";
		String opcion = request.getParameter("optionBM");
		Instructor i ;
		
		String idUserLogin = request.getParameter("idUserLogin");
		
		Usuario userLogin =ctrlUsu.getById(Integer.parseInt(idUserLogin));
		
		request.getSession().setAttribute("usuarioLogin", userLogin);
		
		if(!opcion.equalsIgnoreCase("alta")) {
			String dniIns = request.getParameter("dniInstructor");
			i =ctrlIns.getByDni(dniIns);
			request.setAttribute("instructor", i);
		}else {
			 i = new Instructor();
			request.setAttribute("instructor", i);
		}
		
		switch (opcion) {
		case "alta":
			bandera=request.getParameter("bandera");
			if(bandera.equalsIgnoreCase("aAñadir")) {
				request.getRequestDispatcher("WEB-INF/altaInstructor.jsp").forward(request, response);
			}
			else {
				String dni = request.getParameter("dni");
				String nombre = request.getParameter("nombre");
				String apellido = request.getParameter("apellido");
				String tipoDoc = request.getParameter("selectTipoDoc");
				String telefono = request.getParameter("telefono");
				String email = request.getParameter("email");
				String fechaNacString = request.getParameter("fechaNacimiento");
			
				Instructor ins = new Instructor();
				ins.setNombre(nombre);
				ins.setApellido(apellido);
				ins.setTelefono(telefono);
				ins.setTipo_doc(tipoDoc);
				ins.setDni(dni);
				ins.setEmail(email);
				DateTimeFormatter dateFormat = DateTimeFormatter.ofPattern("yyyy-MM-dd");
			    LocalDate fechaNac = LocalDate.parse(fechaNacString, dateFormat);
				ins.setFecha_nacimiento(fechaNac);
				try {
					ctrlIns.altaInstructor(ins);
					request.setAttribute("mensaje", "Instructor añadido satisfactoriamente.");
					request.setAttribute("color","alert alert-success");
					request.setAttribute("idFila", ins.getDni());
					request.getRequestDispatcher("WEB-INF/InstructoresList.jsp").forward(request, response);
						
				} catch (Exception e) {
					String msg=e.getMessage();
					response.getWriter().append("Error ").append(msg);
				}
			}
		break;
		
		case "modificacion":
			//devolver una bandera q primero rediriga a modificar el user y una vez q fue hecho que se haga el update
			bandera=request.getParameter("bandera");
			
			if (bandera.equalsIgnoreCase("aModificar")) {
				request.getRequestDispatcher("WEB-INF/updateInstructor.jsp").forward(request, response);
			}else {
				String dni = request.getParameter("dni");
				String nombre = request.getParameter("name");
				String apellido = request.getParameter("surname");
				String telefono = request.getParameter("telephone");
				String email = request.getParameter("email");
				String fechaNacString = request.getParameter("fechaNacimiento");
				i.setDni(dni);
				i.setNombre(nombre);
				i.setApellido(apellido);
				i.setTelefono(telefono);
				i.setEmail(email);
				DateTimeFormatter dateFormat = DateTimeFormatter.ofPattern("yyyy-MM-dd");
				LocalDate fechaNac = LocalDate.parse(fechaNacString, dateFormat);
				i.setFecha_nacimiento(fechaNac);		
				
				ctrlIns.modifyInstructor(i);
				request.setAttribute("mensaje", "Instructor modificado satisfactoriamente.");
				request.setAttribute("color","alert alert-success");
				request.setAttribute("idFila", i.getDni());
				request.getRequestDispatcher("WEB-INF/InstructoresList.jsp").forward(request, response);
			}
				
			break;
		case "consulta":
			
			request.getRequestDispatcher("WEB-INF/consultaInstructor.jsp").forward(request, response);
		break;
			
		case "baja":
				int planes=ctrlIns.bajaInstructor(i);
				if(planes>0) {
					request.setAttribute("mensaje", "No se puede eliminar el instructor, porque está inscripto en "+planes+" planes.");
					request.setAttribute("color","alert alert-danger");
				}
				else {
					request.setAttribute("mensaje", "Instructor eliminado satisfactoriamente.");
					request.setAttribute("color","alert alert-success");
				}
				request.getRequestDispatcher("WEB-INF/InstructoresList.jsp").forward(request, response);
			break;
		}
		
		//response.getWriter().append("POST de servlet abmc ").append(u.getUsername()).append(" ").append(opcion);
	}

}
