package ui;



import java.time.LocalDate;
import java.util.LinkedList;

import data.*;
import entities.*;

public class Principal {

	public static void main(String[] args) {
		
		/*
		DataInstructor di = new DataInstructor();
		Instructor i = di.getByDni("16");
		LinkedList<Instructor> instructores =new LinkedList<Instructor>();
		instructores.addAll(di.getAll());
		di.remove(i);
		System.out.println(instructores);
		di.add(i);*/
	
		
		DataGrupoMusculo dgm = new DataGrupoMusculo();
		
		
//		Grupo_Musculo gm= dgm.getById(4) ;
//		gm.setComentario("conjunto de musculos abdominales");
		
		//dgm.add(gm);
		LinkedList<Grupo_Musculo> instructores =new LinkedList<Grupo_Musculo>();
		instructores.addAll(dgm.getAll());
		System.out.println(instructores);
		
		
		
	}

}
