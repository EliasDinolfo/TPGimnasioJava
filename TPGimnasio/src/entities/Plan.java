package entities;

import java.time.LocalDate;
import java.util.LinkedList;

public class Plan {
	private int id_plan;
	private String nombre;
	private String descripcion;
	private LocalDate fecha_expiracion;
	private LinkedList<Instructor> instructores = new LinkedList<Instructor>();
	private LinkedList<Rutina> rutinas = new LinkedList<Rutina>();
	
	public Plan(int id_plan, String nombre, String descripcion, LocalDate fecha_expiracion,
			LinkedList<Instructor> instructores, LinkedList<Rutina> rutinas) {
		this.id_plan = id_plan;
		this.nombre = nombre;
		this.descripcion = descripcion;
		this.fecha_expiracion = fecha_expiracion;
		this.instructores = instructores;
		this.rutinas = rutinas;
	}
	public int getId_plan() {
		return id_plan;
	}
	public void setId_plan(int id_plan) {
		this.id_plan = id_plan;
	}
	public String getNombre() {
		return nombre;
	}
	public void setNombre(String nombre) {
		this.nombre = nombre;
	}
	public String getDescripcion() {
		return descripcion;
	}
	public void setDescripcion(String descripcion) {
		this.descripcion = descripcion;
	}
	public LocalDate getFecha_expiracion() {
		return fecha_expiracion;
	}
	public void setFecha_expiracion(LocalDate fecha_expiracion) {
		this.fecha_expiracion = fecha_expiracion;
	}
	public void setInstructores(Instructor instructor) {
		this.instructores.add(instructor);
	}
	public void setRutinas(Rutina rutina) {
		this.rutinas.add(rutina);
	}
	
	
	
}
