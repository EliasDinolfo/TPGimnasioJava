package data;
import java.sql.*;
import java.time.LocalDate;
import java.util.LinkedList;
import entities.*;

public class DataPlan {
	
	/*
	public LinkedList<Plan> getAll(){
		Statement stmt=null;
		ResultSet rs=null;
		LinkedList<Rol> roles= new LinkedList<>();
		try {
			stmt= dbConnector.getInstancia().getConn().createStatement();
			rs= stmt.executeQuery("select * from persona");
			//intencionalmente no se recupera la password
			if(rs!=null) {
				while(rs.next()) {
					Rol p=new Rol();
					p.setId_rol(rs.getInt("id_rol"));
					p.setDescripcion(rs.getString("descripcion"));
					
					roles.add(p);
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
		return roles;
	}
	*/
	public Plan getById(int id) {
		Plan p=null;
		PreparedStatement stmt=null;
		ResultSet rs=null;
		try {
			stmt=dbConnector.getInstancia().getConn().prepareStatement(
					"select * from plan where id_plan=?"
					);
			stmt.setInt(1, id);
			rs=stmt.executeQuery();
			if(rs!=null && rs.next()) {
				p=new Plan();
				p.setId_plan(rs.getInt("id_plan"));
				p.setDescripcion(rs.getString("descripcion"));
				p.setNombre(rs.getString("nombre"));
				p.setFecha_expiracion(rs.getObject("fecha_expiracion",LocalDate.class));
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
		
		return p;
	}
	
	public void add(Plan p) {
		PreparedStatement stmt= null;
		ResultSet keyResultSet=null;
		try {
			stmt=dbConnector.getInstancia().getConn().
					prepareStatement(
							"insert into plan(id_plan,nombre,descripcion,fecha_expiracion) "
							+ "values(?,?,?,?)");
			stmt.setInt(1, p.getId_plan());
			stmt.setString(2, p.getNombre());
			stmt.setString(3, p.getDescripcion());
			stmt.setObject(4, p.getFecha_expiracion());
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
	
	public void update(Plan plan) {
		PreparedStatement stmt= null;
		try {
			stmt=dbConnector.getInstancia().getConn().
					prepareStatement(
							"update plan set nombre=?, descripcion=?, fecha_expiracion=? "
							+ "where id_plan=?");
			stmt.setString(1, plan.getNombre());
			stmt.setString(2, plan.getDescripcion());
			stmt.setObject(3, plan.getFecha_expiracion());
			stmt.setInt(4, plan.getId_plan());
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
	
	public void remove(Plan plan) {
		PreparedStatement stmt= null;
		try {
			stmt=dbConnector.getInstancia().getConn().
					prepareStatement(
							"delete from plan where id_plan=?");
			stmt.setInt(1, plan.getId_plan());
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
	
	
	
	public void setPlanes(Instructor ins) {
		PreparedStatement stmt=null;
		ResultSet rs=null;
		try {
			stmt=dbConnector.getInstancia().getConn().prepareStatement("select p.*\r\n"
					+ "from plan p\r\n"
					+ "inner join plan_instructor pi\r\n"
					+ "	on p.id_plan=pi.id_plan\r\n"
					+ "where pi.dni=?");
			stmt.setString(1, ins.getDni());
			rs= stmt.executeQuery();
			if(rs!=null) {
				while(rs.next()) {
					Plan p=new Plan();
					p.setId_plan(rs.getInt("id_plan"));
					p.setNombre(rs.getString("nombre"));
					p.setDescripcion(rs.getString("descripcion"));
					p.setFecha_expiracion(rs.getObject("fecha_expiracion",LocalDate.class));
					ins.setPlanes(p);
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
	
	
	
	
	public void setPlanes(Rutina rut) {
		PreparedStatement stmt=null;
		ResultSet rs=null;
		try {
			stmt=dbConnector.getInstancia().getConn().prepareStatement("select pl.*\r\n"
					+ "from plan pl\r\n"
					+ "inner join plan_rutina pr\r\n"
					+ "	on pl.id_plan=pr.id_plan\r\n"
					+ "where pr.id_rutina=?");
			stmt.setInt(1, rut.getId_rutina());
			rs= stmt.executeQuery();
			if(rs!=null) {
				while(rs.next()) {
					Plan p=new Plan();
					p.setId_plan(rs.getInt("id_plan"));
					p.setNombre(rs.getString("nombre"));
					p.setDescripcion(rs.getString("descripcion"));
					p.setFecha_expiracion(rs.getObject("fecha_expiracion",LocalDate.class));
					rut.setPlanes(p);
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

