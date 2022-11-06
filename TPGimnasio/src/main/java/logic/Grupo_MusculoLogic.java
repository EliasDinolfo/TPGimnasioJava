package logic;

import java.util.LinkedList;

import data.DataGrupoMusculo;
import entities.Grupo_Musculo;

public class Grupo_MusculoLogic {
private DataGrupoMusculo dataGm = new DataGrupoMusculo();
	
	
	public void altaGrupo_Musculo(Grupo_Musculo gm) {
		dataGm.add(gm);
	}
	
	public void modifyGrupo_Musculo(Grupo_Musculo gm) {
		dataGm.update(gm);
	}
	
	public LinkedList<Grupo_Musculo> getAll(){
		return dataGm.getAll();
	}
	
	public Grupo_Musculo getById(int id) {
		return dataGm.getById(id);
	}
	
	public int bajaGrupo_Musculo(Grupo_Musculo gm) {
		if(gm.getEjercicios().size()==0) {
			dataGm.remove(gm);
			return 0;
		}
		return gm.getEjercicios().size();
	}
}
