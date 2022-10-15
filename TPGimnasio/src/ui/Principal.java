package ui;

import java.util.LinkedList;

import data.*;
import entities.*;

public class Principal {

	public static void main(String[] args) {
		
		
		DataPlan dh = new DataPlan();
		Plan plan = new Plan();
		plan=dh.getById(1);
		System.out.println(plan);

		
		
	}

}
