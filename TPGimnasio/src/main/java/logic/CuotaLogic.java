package logic;

import data.DataCuota;
import entities.Cuota;

public class CuotaLogic {
	private DataCuota dataCuota = new DataCuota();
	
	public void altaCuota(Cuota c) {
		dataCuota.add(c);
	}
}
