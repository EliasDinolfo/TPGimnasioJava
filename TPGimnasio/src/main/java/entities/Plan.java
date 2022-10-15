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
	private LinkedList<Usuario> usuarios= new LinkedList<Usuario>();
	private LinkedList<Costo> costos= new LinkedList<Costo>();
	private LinkedList<Horario> horarios= new LinkedList<Horario>();
	
	
	public Plan(int id_plan, String nombre, String descripcion, LocalDate fecha_expiracion) {
		this.id_plan = id_plan;
		this.nombre = nombre;
		this.descripcion = descripcion;
		this.fecha_expiracion = fecha_expiracion;
	}
	
	public Plan() {}
	
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
	public void setUsuarios(Usuario user) {
		this.usuarios.add(user);
	}
	public void setCostos(Costo costo) {
		this.costos.add(costo);
	}
	public void setHorarios(Horario horario) {
		this.horarios.add(horario);
	}

	@Override
	public String toString() {
		return "Plan [id_plan=" + id_plan + "]\n, nombre=" + nombre + ", descripcion=" + descripcion
				+ ", fecha_expiracion=" + fecha_expiracion + ", instructores=" + instructores + ", rutinas=" + rutinas
				+ ", usuarios=" + usuarios + ", costos=" + costos + ", horarios=" + horarios + "]\n";
	}
	

	
	
	
	
}
