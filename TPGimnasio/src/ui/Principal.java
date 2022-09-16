package ui;

import data.*;
import entities.*;

public class Principal {

	public static void main(String[] args) {
		
		DataRol dr = new DataRol();
		
		Rol r = dr.getById(3);
		
		r.setDescripcion("usuario");
		
		dr.update(r);
		
	}

}
