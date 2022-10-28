package ui;

import java.time.LocalDate;

import data.DataUsuario;
import entities.Usuario;
import logic.UsuarioLogic;

public class Principal {

	public static void main(String[] args) {
		//este paquete se borrara en el futuro. ahora queda para probar la capa de logica
		
//		Menu menu=new Menu();
//		menu.start();
		UsuarioLogic ctrlLogin =new UsuarioLogic();
		DataUsuario du=new DataUsuario();
		Usuario u = ctrlLogin.getById(23);
		
		u.setNombre("Mauro");
		u.setApellido("Jimenez");
		u.setTelefono("3413417150");
		u.setTipo_doc("DNI");
		u.setDireccion("Los Arrayanez 2417");
		u.setDni("42144241");
		u.setEmail("mauro@gmail.com");
		u.setGenero("mascu");
		u.setUsername("maurojjzz");
		u.setContrasenia("123");
		u.setFecha_nacimiento(LocalDate.parse("1999-10-08"));
		
		du.update(u);
		System.out.println("modificado");
		System.out.println(u);
		System.out.println(ctrlLogin.getById(23));
	} 
		
		
		
		
	}

