package logic;

import java.util.LinkedList;

import data.DataCosto;
import data.DataHorario;
import data.DataPlan;
import entities.Costo;
import entities.Horario;
import entities.Plan;
import entities.Usuario;


public class PlanesLogic {

	private DataPlan dataP= new DataPlan();
	private DataCosto dataC=new DataCosto();
	private DataHorario datah=new DataHorario();
	private Costo costo=new Costo();
	
	public void add(Plan p) {
		dataP.add(p);
	}
	
	public void modifyPlan(Plan p) {
		dataP.update(p);
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
	
	public LinkedList<Horario> getHorarios(Plan p){
		
		LinkedList<Horario> horarios=new LinkedList<Horario>();
		horarios.addAll(datah.getHorarios(p));
	
		return  horarios;
	}
}
