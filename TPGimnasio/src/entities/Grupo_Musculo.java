package entities;

import java.util.LinkedList;

public class Grupo_Musculo {
	private int id_grupo;
	private String nombre;
	private String comentario;
	private LinkedList<Ejercicio> ejercicios = new LinkedList<Ejercicio>();
	
	public Grupo_Musculo(String nombre, String comentario) {
		this.nombre = nombre;
		this.comentario = comentario;
	}
	
	public Grupo_Musculo() {}
	
	public int getId_grupo() {
		return id_grupo;
	}
	public void setId_grupo(int id_grupo) {
		this.id_grupo = id_grupo;
	}
	public String getNombre() {
		return nombre;
	}
	public void setNombre(String nombre) {
		this.nombre = nombre;
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

	@Override
	public String toString() {
		return "Grupo_Musculo [id_grupo=" + id_grupo + ", nombre=" + nombre + ", comentario=" + comentario
				+ ", ejercicios=" + ejercicios + "]\n";
	}
	
	
	
}
