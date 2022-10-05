package ui;




import java.util.LinkedList;

import data.*;
import entities.*;

public class Principal {

	public static void main(String[] args) {
		
		
		DataUsuario du = new DataUsuario();
		LinkedList<Usuario> usuarios=new LinkedList<Usuario>();
		usuarios.addAll(du.getAll());
		System.out.println(usuarios);
		
		
	}

}
