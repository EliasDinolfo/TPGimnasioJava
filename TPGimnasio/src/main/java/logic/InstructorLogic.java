package logic;

import java.util.LinkedList;

import data.DataInstructor;
import entities.Instructor;

public class InstructorLogic {
private DataInstructor dataIns = new DataInstructor();
	
	
	public void altaInstructor(Instructor i) {
		dataIns.add(i);
	}
	
	public void modifyInstructor(Instructor i) {
		dataIns.update(i);
	}
	
	public LinkedList<Instructor> getAll(){
		return dataIns.getAll();
	}
	
	public Instructor getByDni(String dni) {
		return dataIns.getByDni(dni);
	}
	
	public int bajaInstructor(Instructor i) {
		if(i.getPlanes().size()==0) {
			dataIns.remove(i);
			return 0;
		}
		return i.getPlanes().size();
	}
}
