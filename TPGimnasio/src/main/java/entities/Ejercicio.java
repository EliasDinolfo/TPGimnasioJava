package entities;

import java.util.LinkedList;

public class Ejercicio {
	private int id_ejercicio;
	private String nombre;
	private String comentario;
	private String imagen;
	private String video;
	private LinkedList<Rutina> rutinas = new LinkedList<Rutina>();
	private LinkedList<Grupo_Musculo> grupos_musculares = new LinkedList<Grupo_Musculo>();
	
	public Ejercicio( String nombre, String comentario, String imagen, String video) {
		
		this.nombre = nombre;
		this.comentario = comentario;
		this.imagen = imagen;
		this.video = video;
		
	}
	
	@Override
	public String toString() {
		return "Ejercicio [id_ejercicio=" + id_ejercicio + ", nombre=" + nombre + ", comentario=" + comentario
				+ ", imagen=" + imagen + ", video=" + video + ", rutinas=" + rutinas + ", grupos_musculares="
				+ grupos_musculares + "]\n";
	}

	public Ejercicio() {}
	
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
	public String getImagen() {
		return imagen;
	}
	public void setImagen(String imagen) {
		this.imagen = imagen;
	}
	public String getVideo() {
		return video;
	}
	public void setVideo(String video) {
		this.video = video;
	}
	
	public void setRutinas(Rutina rutina) {
		this.rutinas.add(rutina);
	}
	
	public LinkedList<Rutina> getRutinas(){
		return rutinas;
	}
	
	public void setGrupos_musculares(Grupo_Musculo grupo_muscular) {
		this.grupos_musculares.add(grupo_muscular);
	}

	public LinkedList<Grupo_Musculo> getGrupos_musculares(){
		return grupos_musculares;
	}
	
}
