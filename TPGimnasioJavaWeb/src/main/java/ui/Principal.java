package ui;

import java.util.LinkedList;

import data.*;
import entities.*;

public class Principal {

	public static void main(String[] args) {
		
		
		DataHorario dh = new DataHorario();
		Plan plan = new Plan();
		plan.setId_plan(1);
		dh.setHorarios(plan);
		System.out.println(plan);

		
		
	}

}
