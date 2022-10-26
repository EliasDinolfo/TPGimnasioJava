package logic;

import entities.Rol;
import entities.Usuario;

import java.util.LinkedList;

import data.DataRol;
import data.DataUsuario;

public class UsuarioLogic {
	
	private DataUsuario dataUsu = new DataUsuario();
	
	public Rol setRol(int id) {
		Rol rol =new Rol();
		DataRol dr = new DataRol();
		rol=dr.getById(id);
		return rol;
	}
	
	public void altaUser(Usuario u) {
		dataUsu.add(u);
	}
	
	public void modifyUser(Usuario u) {
		dataUsu.update(u);
	}
	
	public Usuario validarLoginUsuario(Usuario u)  {
		Usuario userReturn=dataUsu.getByUsernamePassword(u.getUsername(), u.getContrasenia());
		return userReturn;
	}
	
	public boolean validarContrasenias(String contra1, String contra2)  {
		return contra1.equals(contra2)?true:false;
	}
	
	public LinkedList<Usuario> getAll(){
		return dataUsu.getAll();
	}
	
	public Usuario getById(int id) {
		return dataUsu.getById(id);
	}
	
	public void bajaUser(Usuario u) {
		dataUsu.remove(u);
	}
	
	
}
