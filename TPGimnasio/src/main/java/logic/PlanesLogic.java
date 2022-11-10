package logic;

import java.util.Iterator;
import java.util.LinkedList;

import data.DataCosto;
import data.DataHorario;
import data.DataInstructor;
import data.DataPlan;
import data.DataRutina;
import data.DataUsuario;
import entities.Costo;
import entities.Horario;
import entities.Instructor;
import entities.Plan;
import entities.Rutina;
import entities.Usuario;


public class PlanesLogic {

	private DataPlan dataP= new DataPlan();
	private DataCosto dataC=new DataCosto();
	private DataHorario datah=new DataHorario();
	private DataInstructor datains =new DataInstructor();
	private DataRutina dr = new DataRutina();
	private DataUsuario du=new DataUsuario();
	private Costo costo=new Costo();
	
	public void add(Plan p) {
		
		dataP.add(p);
		dataC.addCosto(p);
		datah.addHorarioPlanes(p);
		datains.addrelacionPlanInstructor(p);
		dr.addrelacionPlanRutina(p);
	}
	
	public void modifyPlan(Plan p) {
		
		dataP.update(p);
		
		//COMIENZO COSTO
		if (!(p.getCostos().isEmpty())) {
			Costo costoAl = p.getCostos().getFirst();
			
			dataC.removecosto(p, this.getCostoActualPlan(p));
			dataC.addCostoMod(p, costoAl);
		}			
		//FIN COSTO

		//empieza instructores
		if (!(p.getInstructores().isEmpty())) {
				LinkedList<Instructor> instructoresElegidos = p.getInstructores();
	
				LinkedList<Instructor> instructoresBD=new LinkedList<Instructor>();
				LinkedList<Instructor> listaAlta=new LinkedList<Instructor>();
				instructoresBD.addAll(datains.getInstructoresPlanes(p));

			if (!instructoresBD.isEmpty()) {
				
				
				for (Instructor inE : instructoresElegidos) {
					for (Instructor insB : instructoresBD) {
						if (inE.getDni().equalsIgnoreCase(insB.getDni())) {
//							System.out.println( inE.getDni()+  " == " +insB.getDni() );
							//no se tiene que hacer nada osea queda igual (quizas sacarlo de la coleccion )
							instructoresBD.remove(insB);
//							System.out.println("se eligio al mismo instructor por lo tanto no se cambia nada");
							break;
						}else {
//							System.out.println( inE.getDni()+  " <> " +insB.getDni() );
							//aca se tendria q dar de alta
//							System.out.println("se debe de dar de alta a: " + inE.getDni());
							listaAlta.add(inE);
						}
					}
				}
				for(int i=0; i<listaAlta.size(); i++){
			        for(int j=i+1; j<listaAlta.size(); j++){
			            if(listaAlta.get(i).equals(listaAlta.get(j))){
			            	listaAlta.remove(j);
			            }
			        }
			    }
			}else {
//				System.out.println("instructores de la bd esta vacio");
				listaAlta.addAll(instructoresElegidos);
			}
			
			datains.removeRelacionesPlan(p , instructoresBD);
			datains.addrelacionPlanInstructores(p, listaAlta);
		}
		
		//aqui termina instructores
		
		
	}
	
	public LinkedList<Plan> getAll(){
		return dataP.getAll();
	}
	
	public Plan getById(int id) {
		return dataP.getById(id);
	}
	
	public void delete(Plan p) {
		dataP.remove(p);
	}
	
	public Costo getCostoActualPlan(Plan p) {
		Costo costo;
		if (dataC.getCosto(p) != null) {
			 costo = dataC.getCosto(p).getFirst();	
		}else {
			costo=null;
		}
		
		
		return costo;
	}
	
	public LinkedList<Horario> getHorarios(Plan p){
		
		LinkedList<Horario> horarios=new LinkedList<Horario>();
		horarios.addAll(datah.getHorarios(p));
	
		return  horarios;
	}
	
	public LinkedList<Instructor> getInstructores(Plan p){
		
		LinkedList<Instructor> instructores =new LinkedList<Instructor> ();
		
		instructores.addAll(datains.getInstructoresPlanes(p));
	
		return  instructores;
	}
	
	public LinkedList<Plan> getPlanesDisponibles(Usuario u){
		LinkedList<Plan> planesUsuario = dataP.getPlanesUsuario(u);
		LinkedList<Plan> planesTotales = dataP.getAll();
		LinkedList<Plan> planesDisponibles = dataP.getAll();
		
		Plan planAEliminar = new Plan();
		
		for (Plan pt : planesTotales) {
			for (Plan pu : planesUsuario) {
				if (pt.getId_plan() == pu.getId_plan()) {
					for (Plan pd : planesDisponibles) {
						if (pt.getId_plan() == pd.getId_plan()) {
							planAEliminar = pd;;
						}
					}
					planesDisponibles.remove(planAEliminar);
				}
			}
		}
		return planesDisponibles;
	}
	
	
	public void addUsuarioPlan(int idU, int idP) {
		dataP.addUsuarioPlan(idU, idP);
	}
	
	public LinkedList<Rutina> getRutinas(Plan p){
		
		LinkedList<Rutina> rutinas =new LinkedList<Rutina> ();
		
		rutinas.addAll(dr.getRutinasDePlan(p));
	
		return  rutinas;
	}
	
	public LinkedList<Usuario> getUsuariosPlan(Plan p){
		
		LinkedList<Usuario> usuarios = new LinkedList<Usuario>();
		usuarios.addAll(du.getUsuariosInscriptos(p));
		
		return usuarios;
	}
	
}







