package servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import entities.Grupo_Musculo;
import entities.Usuario;
import logic.Grupo_MusculoLogic;
import logic.UsuarioLogic;

/**
 * Servlet implementation class ABMCGrupo_Musculo
 */
@WebServlet("/ABMCGrupo_Musculo")
public class ABMCGrupo_Musculo extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ABMCGrupo_Musculo() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		request.getRequestDispatcher("WEB-INF/Grupo_MusculoList.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		UsuarioLogic ctrlUsu= new UsuarioLogic();
		Grupo_MusculoLogic ctrlGm = new Grupo_MusculoLogic();
		
		String bandera="";
		String opcion = request.getParameter("optionBM");
		Grupo_Musculo gm ;
		
		String idUserLogin = request.getParameter("idUserLogin");
		
		Usuario userLogin =ctrlUsu.getById(Integer.parseInt(idUserLogin));
		
		request.getSession().setAttribute("usuarioLogin", userLogin);
		
		if(!opcion.equalsIgnoreCase("alta")) {
			int idGrupo_Musculo = Integer.parseInt(request.getParameter("idGrupo_Musculo"));
			gm =ctrlGm.getById(idGrupo_Musculo);
			request.setAttribute("grupo_musculo", gm);
		}else {
			 gm = new Grupo_Musculo();
			request.setAttribute("grupo_musculo", gm);
		}
		
		switch (opcion) {
		case "alta":
			bandera=request.getParameter("bandera");
			if(bandera.equalsIgnoreCase("aAñadir")) {
				request.getRequestDispatcher("WEB-INF/altaGrupo_Musculo.jsp").forward(request, response);
			}
			else {
				String nombre = request.getParameter("nombre");
				String comentario = request.getParameter("comentario");
			
				Grupo_Musculo grupo = new Grupo_Musculo();
				grupo.setNombre(nombre);
				grupo.setComentario(comentario);
				try {
					ctrlGm.altaGrupo_Musculo(grupo);
					request.setAttribute("mensaje", "Grupo Muscular añadido satisfactoriamente.");
					request.setAttribute("color","alert alert-success");
					request.setAttribute("idFila", grupo.getId_grupo());
					request.getRequestDispatcher("WEB-INF/Grupo_MusculoList.jsp").forward(request, response);
						
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
				request.getRequestDispatcher("WEB-INF/updateGrupo_Musculo.jsp").forward(request, response);
			}else {
				String nombre = request.getParameter("nombre");
				String comentario = request.getParameter("comentario");
				gm.setNombre(nombre);
				gm.setComentario(comentario);		
				
				ctrlGm.modifyGrupo_Musculo(gm);
				request.setAttribute("mensaje", "Grupo Muscular modificado satisfactoriamente.");
				request.setAttribute("color","alert alert-success");
				request.setAttribute("idFila", gm.getId_grupo());
				request.getRequestDispatcher("WEB-INF/Grupo_MusculoList.jsp").forward(request, response);
			}
				
			break;
		case "consulta":
			
			request.getRequestDispatcher("WEB-INF/consultaGrupo_Musculo.jsp").forward(request, response);
		break;
			
		case "baja":
				int ejercicios=ctrlGm.bajaGrupo_Musculo(gm);
				if(ejercicios>0) {
					request.setAttribute("mensaje", "No se puede eliminar el grupo muscular, porque está vinculado en "+ejercicios+" ejercicios.");
					request.setAttribute("color","alert alert-danger");
				}
				else {
					request.setAttribute("mensaje", "Grupo Muscular eliminado satisfactoriamente.");
					request.setAttribute("color","alert alert-success");
				}
				request.getRequestDispatcher("WEB-INF/Grupo_MusculoList.jsp").forward(request, response);
			break;
		}
	}

}
