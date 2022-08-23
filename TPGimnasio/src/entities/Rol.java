package entities;

public class Rol {
	private int id_rol;
	private String descripcion;
	
	public Rol(int id_rol, String descripcion) {
		this.id_rol = id_rol;
		this.descripcion = descripcion;
	}
	
	public Rol() {}
	
	public int getId_rol() {
		return id_rol;
	}
	public void setId_rol(int id_rol) {
		this.id_rol = id_rol;
	}
	public String getDescripcion() {
		return descripcion;
	}
	public void setDescripcion(String descripcion) {
		this.descripcion = descripcion;
	}
	
	
}
