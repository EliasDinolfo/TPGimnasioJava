package servlet;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.time.LocalTime;
import java.time.format.DateTimeFormatter;
import java.util.Iterator;
import java.util.LinkedList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import entities.Costo;
import entities.Horario;
import entities.Instructor;
import entities.Plan;
import entities.Rutina;
import entities.Usuario;
import logic.InstructorLogic;
import logic.PlanesLogic;
import logic.UsuarioLogic;

/**
 * Servlet implementation class ABMCPlan
 */
@WebServlet("/ABMCPlan")
public class ABMCPlan extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ABMCPlan() {
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
		
		String bandera="";
		String opcion = request.getParameter("optionBM");
		Plan p;
		
		
		
		LinkedList<Plan> planes = ctrlPlan.getAll();
		request.setAttribute("listaPlanes", planes);
		
		if(!opcion.equalsIgnoreCase("alta")) {
//			String idUser = request.getParameter("idUser");
//			u =ctrlUsu.getById(Integer.parseInt(idUser));
//			request.setAttribute("usuario", u);
			String idUserLogin = request.getParameter("idUserLogin");
			Usuario userLogin =ctrlUsu.getById(Integer.parseInt(idUserLogin));		
			request.getSession().setAttribute("usuarioLogin", userLogin);
			
			String idPlan = request.getParameter("idPlan");
			
			 p =ctrlPlan.getById(Integer.parseInt(idPlan));
			request.setAttribute("plan", p);
			
		}else {
			 p = new Plan();
			 request.setAttribute("plan", p);
		}
		
		
		
		
		switch (opcion) {
		case "alta":
			bandera=request.getParameter("bandera");
			
			if (bandera.equalsIgnoreCase("aModificar")) {
				request.getRequestDispatcher("WEB-INF/altaPlan.jsp").forward(request, response);
			}else {
				
				
				String idPlan = request.getParameter("idPlan");
				String nombre = request.getParameter("name");
				String descripcion = request.getParameter("description");
				String fechaExpiracion = request.getParameter("fechaExpiracion");
				String costoPlan = request.getParameter("costo");
				
				String horaIni = request.getParameter("horaInicio");
				String horaFin = request.getParameter("horaFin");
				String diasSem = request.getParameter("diasSemana");
				
				String[] instructores =request.getParameterValues("instructores");
				
				String[] rutinas =request.getParameterValues("rutinas");
				
					p.setId_plan(Integer.parseInt(idPlan));
					p.setNombre(nombre);
					p.setDescripcion(descripcion);
					DateTimeFormatter dateFormat = DateTimeFormatter.ofPattern("yyyy-MM-dd");
					LocalDate fechaExp = LocalDate.parse(fechaExpiracion, dateFormat);
					p.setFecha_expiracion(fechaExp);
				//crear un nuevo objeto costo y getCosto y ponerle fecha de hoy
					Costo costo = new Costo();
					costo.setCosto(Double.parseDouble(costoPlan));
					LocalDate fechaVig = LocalDate.now();
					costo.setFecha_vigencia(fechaVig);
					p.setCostos(costo);
				//crear un nuevo objeto Horario y getHorario y agregarle los datos
					Horario hora=new Horario();
					hora.setDias_semana(diasSem);
					//DateTimeFormatter timeFormat =DateTimeFormatter.ofPattern("HH:mm");
					DateTimeFormatter timeFormat = DateTimeFormatter.ofPattern("HH:mm");
					LocalTime horaInicio=LocalTime.parse(horaIni, timeFormat);					
					LocalTime horaFn=LocalTime.parse(horaFin, timeFormat);
					hora.setHora_inicio(horaInicio);
					hora.setHora_fin(horaFn);
					p.setHorarios(hora);
				//Instructores
					
					for (int i = 0; i < instructores.length; i++) {
						Instructor inns= new Instructor();
						inns.setDni(instructores[i]);
						p.setInstructores(inns);
						
					}
					
				//Rutinas
					for (int i = 0; i < rutinas.length; i++) {
						Rutina rutt= new Rutina();
						rutt.setId_rutina(Integer.parseInt(rutinas[i]));
						p.setRutinas(rutt);
					}
					
					
					
				
				ctrlPlan.add(p);
				
				request.getRequestDispatcher("WEB-INF/successfullPlancreated.jsp").forward(request, response);
			}
			
			
			break;
		
		case "modificacion":
			bandera=request.getParameter("bandera");
			
			if (bandera.equalsIgnoreCase("aModificar")) {
				request.getRequestDispatcher("WEB-INF/updatePlan.jsp").forward(request, response);
			}else {
				String nombre = request.getParameter("name");
				String descripcion = request.getParameter("description");
				String fechaExpiracion = request.getParameter("fechaExpiracion");

				String costoPlan = request.getParameter("costo");
				
//				String horaIni = request.getParameter("horaInicio");
//				String horaFin = request.getParameter("horaFin");
//				String diasSem = request.getParameter("diasSemana");
				
				String[] instructores =request.getParameterValues("instructores");
//				String[] instructoresAntes =request.getParameterValues("instructoresAntesModificar");
				
				String[] rutinas =request.getParameterValues("rutinas");
					
					p.setNombre(nombre);
					p.setDescripcion(descripcion);
					DateTimeFormatter dateFormat = DateTimeFormatter.ofPattern("yyyy-MM-dd");
					LocalDate fechaExp = LocalDate.parse(fechaExpiracion, dateFormat);
					p.setFecha_expiracion(fechaExp);
				
					//crear un nuevo objeto costo y getCosto y ponerle fecha de hoy
					//if ( !((ctrlPlan.getCostoActualPlan(p)).getCosto() == Double.parseDouble(costoPlan)) ) {
//						Costo costo = new Costo();
//						costo.setCosto(Double.parseDouble(costoPlan));
//						LocalDate fechaVig = LocalDate.now();
//						costo.setFecha_vigencia(fechaVig);
//						p.setCostos(costo);
						
						
					//}else {
//						Costo costo = new Costo();
//						costo.setCosto(0);
//						p.setCostos(costo);
//					}
					
					

					
				//(otra forma de modificar horario)
					//Horario hora=new Horario();
					//hora.setDias_semana(diasSem);
					
					//DateTimeFormatter timeFormat = DateTimeFormatter.ofPattern("HH:mm");
					//LocalTime horaInicio=LocalTime.parse(horaIni, timeFormat);					
					//LocalTime horaFn=LocalTime.parse(horaFin, timeFormat);
					//hora.setHora_inicio(horaInicio);
					//hora.setHora_fin(horaFn);
					//p.setHorarios(hora);
					
				//Instructores
					if ( !(instructores==null) ) {
						p.getInstructores().clear();
						for (int i = 0; i < instructores.length; i++) {
						Instructor inns= new Instructor();
						inns.setDni(instructores[i]);
//						System.out.println(instructores[i]);
						p.setInstructores(inns);
						
					}
					}else {
						p.getInstructores().clear();
					}
					
					
					
			
				//Rutinas
//					for (int i = 0; i < rutinas.length; i++) {
//						Rutina rutt= new Rutina();
//						rutt.setId_rutina(Integer.parseInt(rutinas[i]));
//						p.setRutinas(rutt);
//					}
				
					
			//una vez terminado descomentarlo
				ctrlPlan.modifyPlan(p);
				request.setAttribute("plan", p);
				request.getRequestDispatcher("WEB-INF/UserManagement.jsp").forward(request, response);
				
			//aqui abajo dejar comentado
//				request.setAttribute("mensaje", "Presionaste consulta. A completar");
//				request.getRequestDispatcher("WEB-INF/updateplanexitoso.jsp").forward(request, response);
			}
				
			break;
		case "consulta":
			
			request.getRequestDispatcher("WEB-INF/consultaPlan.jsp").forward(request, response);
//			request.setAttribute("mensaje", "Presionaste consulta. A completar");
//			request.getRequestDispatcher("WEB-INF/PlanList.jsp").forward(request, response);
			break;
		case "baja":
//				ctrlPlan.bajaPlan(p);
				
				request.setAttribute("mensaje", "La opcion 'Eliminar' esta desactivada por el momento. Intente nuevamente mas tarde.");
				request.getRequestDispatcher("WEB-INF/PlanList.jsp").forward(request, response);
			break;
		}
		
		
		
		
		
	}

}
