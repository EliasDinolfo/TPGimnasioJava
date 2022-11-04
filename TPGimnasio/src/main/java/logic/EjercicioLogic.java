package logic;

import java.util.LinkedList;

import data.DataEjercicio;
import entities.Ejercicio;

public class EjercicioLogic {
	private DataEjercicio dataEj = new DataEjercicio();
	
	public void altaEjercicio(Ejercicio e) {
		dataEj.add(e);
	}
	
	public void modifyEjercicio(Ejercicio e) {
		dataEj.update(e);
	}
	
	public LinkedList<Ejercicio> getAll(){
		return dataEj.getAll();
	}
	
	public Ejercicio getById(int id) {
		return dataEj.getById(id);
	}
	
	public int bajaEjercicio(Ejercicio e) {
		if (e.getRutinas().size() == 0) {
			if (e.getGrupos_musculares().size() == 0) {
				dataEj.remove(e);
				return 0;
			}
			else {
				return e.getGrupos_musculares().size();
			}
		}
		else {
			return e.getRutinas().size() + e.getGrupos_musculares().size();
		}
		
	}

}
