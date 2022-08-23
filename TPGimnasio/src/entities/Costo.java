package entities;

import java.time.LocalDate;

public class Costo {
	private double costo;
	private LocalDate fecha_vigencia;
	private Plan plan;
	
	public Costo(double costo, LocalDate fecha_vigencia, Plan plan) {
		this.costo = costo;
		this.fecha_vigencia = fecha_vigencia;
		this.plan = plan;
	}
	public double getCosto() {
		return costo;
	}
	public void setCosto(double costo) {
		this.costo = costo;
	}
	public LocalDate getFecha_vigencia() {
		return fecha_vigencia;
	}
	public void setFecha_vigencia(LocalDate fecha_vigencia) {
		this.fecha_vigencia = fecha_vigencia;
	}
	public Plan getPlan() {
		return plan;
	}
	public void setPlan(Plan plan) {
		this.plan = plan;
	}
	
	
}
