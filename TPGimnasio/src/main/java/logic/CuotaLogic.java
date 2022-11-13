package logic;

import java.util.LinkedList;

import data.DataCuota;
import entities.Cuota;
import entities.Usuario;

public class CuotaLogic {
	private DataCuota dataCuota = new DataCuota();
	
	public void altaCuota(Cuota c) {
		dataCuota.add(c);
	}

	public LinkedList<Cuota> getAll() {
		return dataCuota.getAll();
	}


	public Cuota getByIdUsuarioFechaVencimiento(int id,String fecha) {
		return dataCuota.getByIdUsuarioFechaVencimiento(id,fecha);
	}
	
	public void setPagoCuota(Cuota cuota) {
		dataCuota.setPagoCuota(cuota);
	}

	public LinkedList<Cuota> getAllPorUsuario(Usuario user) {
		return dataCuota.getAllPorUsuario(user);
	}
}
