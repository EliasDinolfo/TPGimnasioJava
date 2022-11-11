package data;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.time.LocalDate;
import java.util.LinkedList;

import entities.Costo;
import entities.Plan;

public class DataCosto {
	
	public void setCostos(Plan plan) {
		PreparedStatement stmt=null;
		ResultSet rs=null;
		try {
			stmt=dbConnector.getInstancia().getConn().prepareStatement("select *\r\n"
					+ "from costo\r\n"
					+ "where id_plan=?\r\n"
					+ "order by fecha_vigencia desc");
			stmt.setInt(1, plan.getId_plan());
			rs= stmt.executeQuery();
			if(rs!=null) {
				while(rs.next()) {
					Costo c=new Costo();
					c.setFecha_vigencia(rs.getObject("fecha_vigencia",LocalDate.class));
					c.setCosto(rs.getDouble("costo"));
					
					
					plan.setCostos(c);
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
	
	
	public LinkedList<Costo> getCosto(Plan p) {
		
		LinkedList<Costo> costos= new LinkedList<Costo>();
		PreparedStatement stmt=null;
		ResultSet rs=null;
		try {
			stmt=dbConnector.getInstancia().getConn().prepareStatement(
					"SELECT * FROM costo \r\n"
					+ "where id_plan=? \r\n"
					+ "ORDER BY fecha_vigencia desc"
					);
			stmt.setInt(1, p.getId_plan());
			rs=stmt.executeQuery();
			if(rs!=null ) {
				while(rs.next()) {
				Costo c=new Costo();
				c.setCosto(rs.getDouble("costo"));
				c.setFecha_vigencia(rs.getObject("fecha_vigencia", LocalDate.class));
				c.setPlan(p);
				costos.add(c);
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
		if (costos.size()>0) {
			return costos;
		}else {
			
			costos=null;
			return costos;
		}
		
	}
	
	
	public void addCosto(Plan p) {
		PreparedStatement stmt= null;
		ResultSet keyResultSet=null;
		try {
			stmt=dbConnector.getInstancia().getConn().
					prepareStatement(
							"insert into costo(costo,fecha_vigencia,id_plan) "
							+ "values(?,?,?)");
			stmt.setDouble(1, p.getCostos().getFirst().getCosto());
			stmt.setObject(2, p.getCostos().getFirst().getFecha_vigencia());
			stmt.setInt(3, p.getId_plan());
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
	
	
	
	public void updateCosto(Plan p, Costo costo) {
		PreparedStatement stmt= null;
		try {
			stmt=dbConnector.getInstancia().getConn().
					prepareStatement(
							"update costo set costo = ? where id_plan = ? and fecha_vigencia = ?");
			
			stmt.setDouble(1, costo.getCosto());
			stmt.setInt(2, p.getId_plan());
			stmt.setObject(3, costo.getFecha_vigencia());
			stmt.executeUpdate();
			
		}  catch (SQLException e) {
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
	
	public void removecosto(Plan plan, Costo costo) {
		PreparedStatement stmt= null;
		try {
			stmt=dbConnector.getInstancia().getConn().
					prepareStatement(
							"delete from costo where id_plan=? and fecha_vigencia=? ");

			stmt.setInt(1, plan.getId_plan());
			stmt.setObject(2, costo.getFecha_vigencia());
			
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
	
	public void addCostoMod(Plan p, Costo costo) {
		PreparedStatement stmt= null;
		ResultSet keyResultSet=null;
		try {
			stmt=dbConnector.getInstancia().getConn().
					prepareStatement(
							"insert into costo(costo,fecha_vigencia,id_plan) "
							+ "values(?,?,?)");
			stmt.setDouble(1, costo.getCosto());
			stmt.setObject(2, costo.getFecha_vigencia());
			stmt.setInt(3, p.getId_plan());
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
	
	
	
}
