package entities;

import java.sql.Blob;
import java.util.LinkedList;

public class Ejercicio {
	private int id_ejercicio;
	private String nombre;
	private String comentario;
	private Blob imagen;
	private Blob video;
	private LinkedList<Rutina> rutinas = new LinkedList<Rutina>();
	private LinkedList<Grupo_Musculo> grupos_musculares = new LinkedList<Grupo_Musculo>();
	
	public Ejercicio(int id_ejercicio, String nombre, String comentario, Blob imagen, Blob video,
			LinkedList<Rutina> rutinas, LinkedList<Grupo_Musculo> grupos_musculares) {
		this.id_ejercicio = id_ejercicio;
		this.nombre = nombre;
		this.comentario = comentario;
		this.imagen = imagen;
		this.video = video;
		this.rutinas = rutinas;
		this.grupos_musculares = grupos_musculares;
	}
	public int getId_ejercicio() {
		return id_ejercicio;
	}
	public void setId_ejercicio(int id_ejercicio) {
		this.id_ejercicio = id_ejercicio;
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
	public Blob getImagen() {
		return imagen;
	}
	public void setImagen(Blob imagen) {
		this.imagen = imagen;
	}
	public Blob getVideo() {
		return video;
	}
	public void setVideo(Blob video) {
		this.video = video;
	}
	public void setRutinas(Rutina rutina) {
		this.rutinas.add(rutina);
	}
	public void setGrupos_musculares(Grupo_Musculo grupo_muscular) {
		this.grupos_musculares.add(grupo_muscular);
	}
	
}
