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
	
		DataEjercicio de = new DataEjercicio();
		Ejercicio ej=de.getById(3);
		
		de.remove(ej);
		
	
		
		
		
	}

}
