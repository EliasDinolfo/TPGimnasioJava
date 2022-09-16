package ui;

import java.time.LocalDate;

import data.*;
import entities.*;

public class Principal {

	public static void main(String[] args) {
		
		DataPlan dp = new DataPlan();
		
		Plan p = dp.getById(1);
		dp.remove(p);
		
	}

}
