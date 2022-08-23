package entities;

import java.util.LinkedList;

public class Rutina {
	private int id_rutina;
	private String nombre;
	private String semanas;
	private String nivel;
	private String comentario;
	private LinkedList<Ejercicio> ejercicios = new LinkedList<Ejercicio>();
	private LinkedList<Plan> planes = new LinkedList<Plan>();
	
	public Rutina(int id_rutina, String nombre, String semanas, String nivel, String comentario,
			LinkedList<Ejercicio> ejercicios, LinkedList<Plan> planes) {
		this.id_rutina = id_rutina;
		this.nombre = nombre;
		this.semanas = semanas;
		this.nivel = nivel;
		this.comentario = comentario;
		this.ejercicios = ejercicios;
		this.planes = planes;
	}
	
	public Rutina() {}
	
	public int getId_rutina() {
		return id_rutina;
	}
	public void setId_rutina(int id_rutina) {
		this.id_rutina = id_rutina;
	}
	public String getNombre() {
		return nombre;
	}
	public void setNombre(String nombre) {
		this.nombre = nombre;
	}
	public String getSemanas() {
		return semanas;
	}
	public void setSemanas(String semanas) {
		this.semanas = semanas;
	}
	public String getNivel() {
		return nivel;
	}
	public void setNivel(String nivel) {
		this.nivel = nivel;
	}
	public String getComentario() {
		return comentario;
	}
	public void setComentario(String comentario) {
		this.comentario = comentario;
	}
	public void setEjercicios(Ejercicio ejercicio) {
		this.ejercicios.add(ejercicio);
	}
	public void setPlanes(Plan plan) {
		this.planes.add(plan);
	}
	
	
}
