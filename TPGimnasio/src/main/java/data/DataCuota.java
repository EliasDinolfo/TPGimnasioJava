package data;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.time.LocalDate;

import entities.Cuota;

import entities.Usuario;

public class DataCuota {
	
	public void setCuotas(Usuario usu) {
		PreparedStatement stmt=null;
		ResultSet rs=null;
		try {
			stmt=dbConnector.getInstancia().getConn().prepareStatement("select *\r\n"
					+ "from cuota\r\n"
					+ "where id_usuario=?");
			stmt.setInt(1, usu.getId_usuario());
			rs= stmt.executeQuery();
			if(rs!=null) {
				while(rs.next()) {
					Cuota c=new Cuota();
					c.setFecha_pago(rs.getObject("fecha_pago",LocalDate.class));
					c.setMonto(rs.getDouble("monto"));
					c.setForma_pago(rs.getString("forma_pago"));
					
					
					usu.setCuotas(c);
				}
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			try {
				if(rs!=null) {rs.close();}
				if(stmt!=null) {stmt.close();}
				dbConnector.getInstancia().releaseConn();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
	}
}
