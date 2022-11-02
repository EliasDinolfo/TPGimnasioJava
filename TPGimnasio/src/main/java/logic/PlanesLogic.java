package logic;

import java.util.LinkedList;

import data.DataPlan;
import entities.Plan;


public class PlanesLogic {

	private DataPlan dataP= new DataPlan();
	
	
	public void altaPlan(Plan p) {
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
	
	public void bajaPlan(Plan p) {
		dataP.remove(p);
	}
	
}
