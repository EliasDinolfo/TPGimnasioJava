package data;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.time.LocalDate;
import java.util.LinkedList;

import entities.Ejercicio;
import entities.Grupo_Musculo;
import entities.Instructor;
import entities.Plan;

public class DataEjercicio {
	
	public LinkedList<Ejercicio> getAll(){
		//DataPlan dp =new DataPlan();
		Statement stmt=null;
		ResultSet rs=null;
		LinkedList<Ejercicio> ejercicios= new LinkedList<>();
		try {
			stmt= dbConnector.getInstancia().getConn().createStatement();
			rs= stmt.executeQuery("select * from ejercicio");
			
			if(rs!=null) {
				while(rs.next()) {
					Ejercicio in=new Ejercicio();
					in.setId_ejercicio(rs.getInt("id_ejercicio"));
					in.setNombre(rs.getString("nombre"));
					in.setComentario(rs.getString("comentario"));
					in.setImagen(rs.getString("imagen"));
					in.setVideo(rs.getString("video"));
					//dp.setPlanes(in);

					ejercicios.add(in);
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
		return ejercicios;
	}
	
	
	public Ejercicio getById(int id) {
		//DataPlan dp=new DataPlan() ;
		Ejercicio eje=null;
		
		PreparedStatement stmt=null;
		ResultSet rs=null;
		try {
			stmt=dbConnector.getInstancia().getConn().prepareStatement(
					"select * from ejercicio where id_ejercicio=?"
					);
			stmt.setInt(1, id);
			rs=stmt.executeQuery();
			if(rs!=null && rs.next()) {
				eje=new Ejercicio();
				eje.setId_ejercicio(rs.getInt("id_ejercicio"));
				eje.setNombre(rs.getString("nombre"));
				eje.setComentario(rs.getString("comentario"));
				eje.setImagen(rs.getString("imagen"));
				eje.setVideo(rs.getString("video"));
				
				//dp.setPlanes(i);
				
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
		
		return eje;
	}
	
	public void add(Ejercicio ej) {
		PreparedStatement stmt= null;
		ResultSet keyResultSet=null;
		try {
			stmt=dbConnector.getInstancia().getConn().
					prepareStatement(
							"insert into ejercicio (nombre,comentario,imagen,video) values(?,?,?,?)",
							PreparedStatement.RETURN_GENERATED_KEYS);
			stmt.setString(1, ej.getNombre());
			stmt.setString(2, ej.getComentario());
			stmt.setString(3, ej.getImagen());
			stmt.setString(4, ej.getVideo());
			stmt.executeUpdate();
			
			keyResultSet=stmt.getGeneratedKeys();
            if(keyResultSet!=null && keyResultSet.next()){
                ej.setId_ejercicio(keyResultSet.getInt(1));;
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
	
	
	public void update(Ejercicio eje) {
		PreparedStatement stmt= null;
		try {
			stmt=dbConnector.getInstancia().getConn().
					prepareStatement(
						"UPDATE ejercicio SET nombre = ?, comentario = ?, imagen=?, video=?   WHERE (id_ejercicio = ?)");
			
			stmt.setString(1, eje.getNombre());
			stmt.setString(2, eje.getComentario());
			stmt.setString(3, eje.getImagen());
			stmt.setString(4, eje.getVideo());
			stmt.setInt(5, eje.getId_ejercicio());
				
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
	
	public void remove(Ejercicio eje) {
		PreparedStatement stmt= null;
		try {
			stmt=dbConnector.getInstancia().getConn().
					prepareStatement(
							"delete from ejercicio where id_ejercicio=?");
			stmt.setInt(1, eje.getId_ejercicio());
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
	
	public void setEjercicios(Grupo_Musculo gru) {
		PreparedStatement stmt=null;
		ResultSet rs=null;
		try {
			stmt=dbConnector.getInstancia().getConn().prepareStatement("select ej.*\r\n"
					+ "from ejercicio ej\r\n"
					+ "inner join ejercicio_grupo eg\r\n"
					+ "	on ej.id_ejercicio=eg.id_ejercicio\r\n"
					+ "where eg.id_grupo=?");
			stmt.setInt(1, gru.getId_grupo());
			rs= stmt.executeQuery();
			if(rs!=null) {
				while(rs.next()) {
					Ejercicio p=new Ejercicio();
					p.setId_ejercicio(rs.getInt("id_ejercicio"));
					p.setNombre(rs.getString("nombre"));
					p.setComentario(rs.getString("comentario"));
					p.setImagen(rs.getString("imagen"));
					p.setVideo(rs.getString("video"));
					
					gru.setEjercicios(p);
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
