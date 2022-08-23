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
	public LinkedList<Rutina> getRutinas() {
		return rutinas;
	}
	public void setRutinas(LinkedList<Rutina> rutinas) {
		this.rutinas = rutinas;
	}
	
	
}
