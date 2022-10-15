package entities;

import java.time.LocalDate;
import java.util.LinkedList;

public class Instructor {
	private String dni;
	private String tipo_doc;
	private String nombre;
	private String apellido;
	private LocalDate fecha_nacimiento;
	private String email;
	private String telefono;
	private LinkedList<Plan> planes = new LinkedList<Plan>();
	
	public Instructor(String dni, String tipo_doc, String nombre, String apellido, LocalDate fecha_nacimiento,
			String email, String telefono) {
		this.dni = dni;
		this.tipo_doc = tipo_doc;
		this.nombre = nombre;
		this.apellido = apellido;
		this.fecha_nacimiento = fecha_nacimiento;
		this.email = email;
		this.telefono = telefono;
		
	}
	
	@Override
	public String toString() {
		return "Instructor [dni=" + dni + ", tipo_doc=" + tipo_doc + ", nombre=" + nombre + ", apellido=" + apellido
				+ ", fecha_nacimiento=" + fecha_nacimiento + ", email=" + email + ", telefono=" + telefono + ", planes="
				+ planes + "]\n";
	}

	public Instructor() {}
	
	public String getDni() {
		return dni;
	}
	public void setDni(String dni) {
		this.dni = dni;
	}
	public String getTipo_doc() {
		return tipo_doc;
	}
	public void setTipo_doc(String tipo_doc) {
		this.tipo_doc = tipo_doc;
	}
	public String getNombre() {
		return nombre;
	}
	public void setNombre(String nombre) {
		this.nombre = nombre;
	}
	public String getApellido() {
		return apellido;
	}
	public void setApellido(String apellido) {
		this.apellido = apellido;
	}
	public LocalDate getFecha_nacimiento() {
		return fecha_nacimiento;
	}
	public void setFecha_nacimiento(LocalDate fecha_nacimiento) {
		this.fecha_nacimiento = fecha_nacimiento;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getTelefono() {
		return telefono;
	}
	public void setTelefono(String telefono) {
		this.telefono = telefono;
	}
	public void setPlanes(Plan plan) {
		this.planes.add(plan);
	}
	
}
