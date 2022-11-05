package logic;

import java.util.LinkedList;

import data.DataCosto;
import data.DataHorario;
import data.DataPlan;
import entities.Costo;
import entities.Horario;
import entities.Plan;


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
	
	public LinkedList<Horario> getHorarios(Plan p){
		
		LinkedList<Horario> horarios=new LinkedList<Horario>();
		horarios.addAll(datah.getHorarios(p));
	
		return  horarios;
	}
	
}
