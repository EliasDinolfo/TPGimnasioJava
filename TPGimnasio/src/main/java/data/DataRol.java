package data;
import java.sql.*;
import java.util.LinkedList;
import entities.*;

public class DataRol {
	
	
	public LinkedList<Rol> getAll(){
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
	
	public Rol getById(int id) {
		Rol r=null;
		PreparedStatement stmt=null;
		ResultSet rs=null;
		try {
			stmt=dbConnector.getInstancia().getConn().prepareStatement(
					"select * from rol where id_rol=?"
					);
			stmt.setInt(1, id);
			rs=stmt.executeQuery();
			if(rs!=null && rs.next()) {
				r=new Rol();
				r.setId_rol(rs.getInt("id_rol"));
				r.setDescripcion(rs.getString("descripcion"));
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
		
		return r;
	}
	
	public void add(Rol r) {
		PreparedStatement stmt= null;
		ResultSet keyResultSet=null;
		try {
			stmt=dbConnector.getInstancia().getConn().
					prepareStatement(
							"insert into rol(descripcion) values(?)",
							PreparedStatement.RETURN_GENERATED_KEYS
							);
			stmt.setString(1, r.getDescripcion());
			stmt.executeUpdate();
			
			keyResultSet=stmt.getGeneratedKeys();
            if(keyResultSet!=null && keyResultSet.next()){
                r.setId_rol(keyResultSet.getInt(1));
            }
			
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
	
	public void update(Rol rol) {
		PreparedStatement stmt= null;
		try {
			stmt=dbConnector.getInstancia().getConn().
					prepareStatement(
							"update rol set descripcion=? where id_rol=?");
			stmt.setString(1, rol.getDescripcion());
			stmt.setInt(2, rol.getId_rol());
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
	
	public void remove(Rol rol) {
		PreparedStatement stmt= null;
		try {
			stmt=dbConnector.getInstancia().getConn().
					prepareStatement(
							"delete from rol where id_rol=?");
			stmt.setInt(1, rol.getId_rol());
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
