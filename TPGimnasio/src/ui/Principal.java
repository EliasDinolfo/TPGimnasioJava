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
	
//		DataGrupoMusculo de = new DataGrupoMusculo();
//		Grupo_Musculo ej=de.getById(2);
//		
//		System.out.println(ej);
		
	
		DataEjercicio dr = new DataEjercicio();
//		LinkedList<Ejercicio> instructores =new LinkedList<Ejercicio>();
//		instructores.addAll(dr.getAll());
		Ejercicio ru= dr.getById(1);
		
		System.out.println(ru);
		
		
		
	}

}
