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
	
	public void add(Cuota c) {
		PreparedStatement stmt= null;
		ResultSet keyResultSet=null;
		try {
			stmt=dbConnector.getInstancia().getConn().
					prepareStatement(
							"insert into cuota(fecha_vencimiento,fecha_pago,monto,forma_pago,id_usuario) "
							+ "values(?,?,?,?,?)");
			stmt.setObject(1, c.getFecha_vencimiento());
			stmt.setObject(2, c.getFecha_pago());
			stmt.setDouble(3, c.getMonto());
			stmt.setString(4, c.getForma_pago());
			stmt.setInt(5, c.getUsuario().getId_usuario());
			stmt.executeUpdate();
			
		}  catch (SQLException e) {
            e.printStackTrace();
		} finally {
            try {
                if(keyResultSet!=null)keyResultSet.close();
                if(stmt!=null)stmt.close();
                dbConnector.getInstancia().releaseConn();
            } catch (SQLException e) {
            	e.printStackTrace();
            }
		}
		
    }
	
	public void remove(Usuario user) {
		PreparedStatement stmt= null;
		try {
			stmt=dbConnector.getInstancia().getConn().
					prepareStatement(
							"delete from cuota where id_usuario=?");
			stmt.setInt(1, user.getId_usuario());
			stmt.executeUpdate();
		} catch (SQLException e) {
            e.printStackTrace();
		} finally {
            try {
                if(stmt!=null)stmt.close();
                dbConnector.getInstancia().releaseConn();
            } catch (SQLException e) {
            	e.printStackTrace();
            }
		}
	}
}
