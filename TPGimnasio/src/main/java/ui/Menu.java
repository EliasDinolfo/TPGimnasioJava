package ui;

import java.util.Scanner;

import entities.Usuario;
import logic.Login;

public class Menu {

	Scanner in = new Scanner(System.in);
	Login ctrlLogin =new Login();
	
	public void start() {
		
		logeoUsu();
			
		
	}
	
	public void logeoUsu() {
		Usuario u = new Usuario();
		System.out.println("Ingrese usuario");
		u.setUsername(in.nextLine());
		System.out.println("Ingrese contraseña");
		u.setContrasenia(in.nextLine());
		
		u=ctrlLogin.validate(u);
		
		if(u!=null) {
			System.out.println(u);
		}else {
			System.out.println("Usuario/contraseña incorrecto o sin registrar");
		}
		in.close();
	}
}
