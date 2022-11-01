package logic;

import java.util.LinkedList;

import data.DataRutina;
import entities.Rutina;

public class RutinaLogic {
	private DataRutina dataRut = new DataRutina();
	
	public void altaRutina(Rutina r) {
		dataRut.add(r);
	}
	
	public void modifyRutina(Rutina r) {
		dataRut.update(r);
	}
	
	public LinkedList<Rutina> getAll(){
		return dataRut.getAll();
	}
	
	public Rutina getById(int id) {
		return dataRut.getById(id);
	}
	
	public int bajaRutina(Rutina r) {
		if (r.getPlanes().size() == 0) {
			dataRut.remove(r);
			return 0;
		}
		else {
			return (r.getPlanes().size());
		}
		
	}

}
