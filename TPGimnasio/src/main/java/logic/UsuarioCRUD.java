package logic;

import data.DataRol;
import data.DataUsuario;
import entities.Rol;
import entities.Usuario;

public class UsuarioCRUD {
	private DataUsuario dataUsu = new DataUsuario();
		
	//Reveer este metodo, quizas es mejor ponerlo en una clase Rol en el paquete logic
	
	public Rol setRol(int id) {
		Rol rol =new Rol();
		DataRol dr = new DataRol();
		rol=dr.getById(id);
		return rol;
	}
	
	
	public void altaUser(Usuario u) {
		dataUsu.add(u);
	}
	
}
