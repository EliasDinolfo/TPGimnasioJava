package logic;

import entities.Usuario;

import java.util.LinkedList;

import data.DataUsuario;

public class Login {
	
	private DataUsuario dataUsu = new DataUsuario();
	
	
	
	public Usuario validate(Usuario u)  {
		
		LinkedList<Usuario> usuarios =new LinkedList<Usuario>();
		usuarios.addAll(dataUsu.getAll());
		Usuario userReturn=null;
		
		for (Usuario usu : usuarios) {
			if( u.getUsername().equals(usu.getUsername()) && u.getContrasenia().equals(usu.getContrasenia())) {
				userReturn= new Usuario();
				userReturn.setId_usuario(usu.getId_usuario());
				
				userReturn=dataUsu.getById(userReturn.getId_usuario());				
				
			}
		}
		
		
		return userReturn;
	}
	
	
}
