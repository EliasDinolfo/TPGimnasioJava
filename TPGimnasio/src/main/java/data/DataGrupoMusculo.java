package data;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.LinkedList;

import entities.Ejercicio;
import entities.Grupo_Musculo;


public class DataGrupoMusculo {
	
	public LinkedList<Grupo_Musculo> getAll(){
		DataEjercicio de =new DataEjercicio();
		Statement stmt=null;
		ResultSet rs=null;
		LinkedList<Grupo_Musculo> musculos= new LinkedList<>();
		try {
			stmt= dbConnector.getInstancia().getConn().createStatement();
			rs= stmt.executeQuery("select * from grupo_musculo");
			
			if(rs!=null) {
				while(rs.next()) {
					Grupo_Musculo in=new Grupo_Musculo();
					in.setId_grupo(rs.getInt("id_grupo"));
					in.setNombre(rs.getString("nombre"));
					in.setComentario(rs.getString("comentario"));
					de.setEjercicios(in);

					musculos.add(in);
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
		return musculos;
	}
	
	
	public Grupo_Musculo getById(int id) {
		DataEjercicio de =new DataEjercicio();
		Grupo_Musculo gru=null;
		
		PreparedStatement stmt=null;
		ResultSet rs=null;
		try {
			stmt=dbConnector.getInstancia().getConn().prepareStatement(
					"select * from grupo_musculo where id_grupo=?"
					);
			stmt.setInt(1, id);
			rs=stmt.executeQuery();
			if(rs!=null && rs.next()) {
				gru=new Grupo_Musculo();
				gru.setId_grupo(rs.getInt("id_grupo"));
				gru.setNombre(rs.getString("nombre"));
				gru.setComentario(rs.getString("comentario"));
				
				de.setEjercicios(gru);
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
		
		return gru;
	}
	
	public void add(Grupo_Musculo gm) {
		PreparedStatement stmt= null;
		ResultSet keyResultSet=null;
		try {
			stmt=dbConnector.getInstancia().getConn().
					prepareStatement(
							"insert into grupo_musculo (nombre,comentario) values(?,?)",
							PreparedStatement.RETURN_GENERATED_KEYS);
			stmt.setString(1, gm.getNombre());
			stmt.setString(2, gm.getComentario());
			stmt.executeUpdate();
			
			keyResultSet=stmt.getGeneratedKeys();
            if(keyResultSet!=null && keyResultSet.next()){
                gm.setId_grupo(keyResultSet.getInt(1));
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
	
	
	public void update(Grupo_Musculo gru_mus) {
		PreparedStatement stmt= null;
		try {
			stmt=dbConnector.getInstancia().getConn().
					prepareStatement(
								"UPDATE grupo_musculo SET nombre = ?, comentario = ? WHERE (id_grupo = ?)");
			
			stmt.setString(1, gru_mus.getNombre());
			stmt.setString(2, gru_mus.getComentario());
			stmt.setInt(3, gru_mus.getId_grupo());
				
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
	
	public void remove(Grupo_Musculo gm) {
		PreparedStatement stmt= null;
		try {
			stmt=dbConnector.getInstancia().getConn().
					prepareStatement(
							"delete from grupo_musculo where id_grupo=?");
			stmt.setInt(1, gm.getId_grupo());
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
	
	
	public void setGrupoMusculos(Ejercicio eje) {
		PreparedStatement stmt=null;
		ResultSet rs=null;
		try {
			stmt=dbConnector.getInstancia().getConn().prepareStatement("select gm.*\r\n"
					+ "from grupo_musculo gm\r\n"
					+ "inner join ejercicio_grupo eg\r\n"
					+ "	on gm.id_grupo=eg.id_grupo\r\n"
					+ "where eg.id_ejercicio=?");
			stmt.setInt(1, eje.getId_ejercicio());
			rs= stmt.executeQuery();
			if(rs!=null) {
				while(rs.next()) {
					Grupo_Musculo p=new Grupo_Musculo();
					p.setId_grupo(rs.getInt("id_grupo"));
					p.setNombre(rs.getString("nombre"));
					p.setComentario(rs.getString("comentario"));		
					eje.setGrupos_musculares(p);
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
