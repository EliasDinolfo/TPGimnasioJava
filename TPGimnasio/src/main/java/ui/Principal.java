package ui;

import java.util.LinkedList;

import data.*;
import entities.*;

public class Principal {

	public static void main(String[] args) {
		
		LinkedList<Plan> planes = new LinkedList<Plan>();
		DataPlan dh = new DataPlan();
		planes.addAll(dh.getAll());
		System.out.println(planes);

		
	}

}
