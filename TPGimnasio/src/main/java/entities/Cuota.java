package entities;

import java.time.LocalDate;

public class Cuota {
	private LocalDate fecha_pago;
	private double monto;
	private String forma_pago;
	private Usuario usuario;
	
	@Override
	public String toString() {
		return "Cuota [fecha_pago=" + fecha_pago + ", monto=" + monto + ", forma_pago=" + forma_pago + "]\n";
	}
	
	public LocalDate getFecha_pago() {
		return fecha_pago;
	}
	public void setFecha_pago(LocalDate fecha_pago) {
		this.fecha_pago = fecha_pago;
	}
	public double getMonto() {
		return monto;
	}
	public void setMonto(double monto) {
		this.monto = monto;
	}
	public String getForma_pago() {
		return forma_pago;
	}
	public void setForma_pago(String forma_pago) {
		this.forma_pago = forma_pago;
	}
	
	public Usuario getUsuario() {
		return usuario;
	}
	public void setUsuario(Usuario usuario) {
		this.usuario = usuario;
	}
	
	
	
}
