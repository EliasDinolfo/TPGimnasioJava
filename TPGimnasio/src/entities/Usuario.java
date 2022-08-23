package entities;

import java.time.LocalDate;

public class Usuario {
	private int id_usuario;
	private String nombre;
	private String apellido;
	private String telefono;
	private String tipo_doc;
	private String dni;
	private String email;
	private String genero;
	private String username;
	private String contrasenia;
	private String direccion;
	private LocalDate fecha_nacimiento;
	private Rol rol;
	private Plan plan;
	
	
	public Usuario(int id_usuario, String nombre, String apellido, String telefono, String tipo_doc, String dni,
			String email, String genero, String username, String contrasenia, String direccion,
			LocalDate fecha_nacimiento, Rol rol, Plan plan) {
		this.id_usuario = id_usuario;
		this.nombre = nombre;
		this.apellido = apellido;
		this.telefono = telefono;
		this.tipo_doc = tipo_doc;
		this.dni = dni;
		this.email = email;
		this.genero = genero;
		this.username = username;
		this.contrasenia = contrasenia;
		this.direccion = direccion;
		this.fecha_nacimiento = fecha_nacimiento;
		this.rol = rol;
		this.plan = plan;
	}
	public int getId_usuario() {
		return id_usuario;
	}
	public void setId_usuario(int id_usuario) {
		this.id_usuario = id_usuario;
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
	public String getTelefono() {
		return telefono;
	}
	public void setTelefono(String telefono) {
		this.telefono = telefono;
	}
	public String getTipo_doc() {
		return tipo_doc;
	}
	public void setTipo_doc(String tipo_doc) {
		this.tipo_doc = tipo_doc;
	}
	public String getDni() {
		return dni;
	}
	public void setDni(String dni) {
		this.dni = dni;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getGenero() {
		return genero;
	}
	public void setGenero(String genero) {
		this.genero = genero;
	}
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public String getContrasenia() {
		return contrasenia;
	}
	public void setContrasenia(String contrasenia) {
		this.contrasenia = contrasenia;
	}
	public String getDireccion() {
		return direccion;
	}
	public void setDireccion(String direccion) {
		this.direccion = direccion;
	}
	public LocalDate getFecha_nacimiento() {
		return fecha_nacimiento;
	}
	public void setFecha_nacimiento(LocalDate fecha_nacimiento) {
		this.fecha_nacimiento = fecha_nacimiento;
	}
	public Rol getRol() {
		return rol;
	}
	public void setRol(Rol rol) {
		this.rol = rol;
	}
	public Plan getPlan() {
		return plan;
	}
	public void setPlan(Plan plan) {
		this.plan = plan;
	}
	
}
