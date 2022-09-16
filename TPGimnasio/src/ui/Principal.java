package ui;

import java.time.LocalDate;

import data.*;
import entities.*;

public class Principal {

	public static void main(String[] args) {
		
		
		DataUsuario du = new DataUsuario();
		Usuario u=du.getById(5);
		du.remove(u);
		
	}

}
