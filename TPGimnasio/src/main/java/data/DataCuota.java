package data;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.time.LocalDate;
import java.util.Date;
import java.util.LinkedList;

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

	public LinkedList<Cuota> getAll(){
		Statement stmt=null;
		ResultSet rs=null;
		DataUsuario du = new DataUsuario();
		Usuario user;
		LinkedList<Cuota> cuotas= new LinkedList<Cuota>();
		try {
			stmt= dbConnector.getInstancia().getConn().createStatement();
			rs= stmt.executeQuery("select * from cuota");
			
			if(rs!=null) {
				while(rs.next()) {
					Cuota c =new Cuota();
					c.setFecha_pago(rs.getObject("fecha_pago", LocalDate.class));
					c.setFecha_vencimiento(rs.getObject("fecha_vencimiento", LocalDate.class));
					c.setMonto(rs.getDouble("monto"));
					c.setForma_pago(rs.getString("forma_pago"));
					user=du.getById(rs.getInt("id_usuario"));
					c.setUsuario(user);
					cuotas.add(c);
				}
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
			
		} finally {
			try {
				if(rs!=null) {rs.close();}
				if(stmt!=null) {stmt.close();}
				dbConnector.getInstancia().releaseConn();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return cuotas;
	}

	public Cuota getByIdUsuarioFechaVencimiento(int id, String fecha) {
		PreparedStatement stmt=null;
		ResultSet rs=null;
		Cuota cuota = null;
		Usuario user;
		DataUsuario du = new DataUsuario();
		try {
			stmt=dbConnector.getInstancia().getConn().prepareStatement(
					"select * from cuota where id_usuario=? and fecha_vencimiento=?"
					);
			stmt.setInt(1, id);
			stmt.setObject(2, fecha);
			rs=stmt.executeQuery();
			if(rs!=null && rs.next()) {
				cuota=new Cuota();
				cuota.setMonto(rs.getDouble("monto"));
				cuota.setFecha_vencimiento(rs.getObject("fecha_vencimiento", LocalDate.class));
				cuota.setFecha_pago(rs.getObject("fecha_pago", LocalDate.class));
				cuota.setForma_pago(rs.getString("forma_pago"));
				user=du.getById(id);
				cuota.setUsuario(user);
				
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
		
		return cuota;
	}

	public void setPagoCuota(Cuota cuota) {
		PreparedStatement stmt= null;
		try {
			stmt=dbConnector.getInstancia().getConn().
					prepareStatement(
						"UPDATE cuota SET forma_pago = ?, fecha_pago=? WHERE id_usuario=? and fecha_vencimiento=?");
			
			stmt.setString(1, cuota.getForma_pago());
			stmt.setObject(2, LocalDate.now());
			stmt.setInt(3, cuota.getUsuario().getId_usuario());
			stmt.setObject(4, cuota.getFecha_vencimiento());
				
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
