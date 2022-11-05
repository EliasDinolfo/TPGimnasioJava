package entities;

import java.time.LocalTime;

public class Horario {
	private LocalTime hora_inicio;
	private LocalTime hora_fin;
	private String dias_semana;
	private Plan plan;
	
	public Horario(LocalTime hora_inicio, LocalTime hora_fin, String dias_semana, Plan plan) {
		this.hora_inicio = hora_inicio;
		this.hora_fin = hora_fin;
		this.dias_semana = dias_semana;
		this.plan = plan;
	}
	
	public Horario() {}
	
	public LocalTime getHora_inicio() {
		return hora_inicio;
	}
	public void setHora_inicio(LocalTime hora_inicio) {
		this.hora_inicio = hora_inicio;
	}
	public LocalTime getHora_fin() {
		return hora_fin;
	}
	public void setHora_fin(LocalTime hora_fin) {
		this.hora_fin = hora_fin;
	}
	public String getDias_semana() {
		return dias_semana;
	}
	public void setDias_semana(String dias_semana) {
		this.dias_semana = dias_semana;
	}
	public void setPlan(Plan plan) {
		this.plan = plan;
	}
	public Plan getPlan() {
		return plan;
	}

	@Override
	public String toString() {
		return "Horario [hora_inicio=" + hora_inicio + ", hora_fin=" + hora_fin + ", dias_semana=" + dias_semana +"]\n";
	}
	
}
