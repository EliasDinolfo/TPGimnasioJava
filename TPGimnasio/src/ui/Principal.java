package ui;



import java.time.LocalDate;

import data.*;
import entities.*;

public class Principal {

	public static void main(String[] args) {
		
		
		DataInstructor di = new DataInstructor();
		Instructor i = di.getByDni("111");
			
		di.remove(i);
		//System.out.println(i);
		//di.add(i);
	
		
	}

}
