package entities;

public class Rol {
	private int id_rol;
	private String descripcion;
	
	public Rol(String descripcion) {
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

	@Override
	public String toString() {
		return "Rol [id_rol=" + id_rol + ", descripcion=" + descripcion + "]";
	}
	
	
}
