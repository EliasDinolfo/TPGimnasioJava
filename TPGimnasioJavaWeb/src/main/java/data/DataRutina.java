package data;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.LinkedList;

import entities.Ejercicio;

import entities.Plan;
import entities.Rutina;

public class DataRutina {
	
	public LinkedList<Rutina> getAll(){
		DataEjercicio de =new DataEjercicio();
		DataPlan dp=new DataPlan();
		Statement stmt=null;
		ResultSet rs=null;
		LinkedList<Rutina> rutinas= new LinkedList<>();
		try {
			stmt= dbConnector.getInstancia().getConn().createStatement();
			rs= stmt.executeQuery("select * from rutina");
			
			if(rs!=null) {
				while(rs.next()) {
					Rutina in=new Rutina();
					in.setId_rutina(rs.getInt("id_rutina"));
					in.setNombre(rs.getString("nombre"));
					in.setComentario(rs.getString("semanas"));
					in.setNivel(rs.getString("nivel"));
					in.setComentario(rs.getString("comentario"));
					de.setEjercicios(in);
					dp.setPlanes(in);
					rutinas.add(in);
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
		return rutinas;
	}
	
	
	public Rutina getById(int id) {
		DataEjercicio de =new DataEjercicio();
		DataPlan dp=new DataPlan();
		Rutina rut=null;
		
		PreparedStatement stmt=null;
		ResultSet rs=null;
		try {
			stmt=dbConnector.getInstancia().getConn().prepareStatement(
					"select * from rutina where id_rutina=?"
					);
			stmt.setInt(1, id);
			rs=stmt.executeQuery();
			if(rs!=null && rs.next()) {
				rut=new Rutina();
				rut.setId_rutina(rs.getInt("id_rutina"));
				rut.setNombre(rs.getString("nombre"));
				rut.setComentario(rs.getString("comentario"));
				rut.setSemanas(rs.getString("semanas"));
				rut.setNivel(rs.getString("nivel"));
				dp.setPlanes(rut);
				de.setEjercicios(rut);
				
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
		
		return rut;
	}
	
	public void add(Rutina ru) {
		PreparedStatement stmt= null;
		ResultSet keyResultSet=null;
		try {
			stmt=dbConnector.getInstancia().getConn().
					prepareStatement(
							"insert into rutina (nombre,semanas,nivel,comentario) values(?,?,?,?)",
							PreparedStatement.RETURN_GENERATED_KEYS);
			stmt.setString(1, ru.getNombre());
			stmt.setString(2, ru.getSemanas());
			stmt.setString(3, ru.getNivel());
			stmt.setString(4, ru.getComentario());
			stmt.executeUpdate();
			
			keyResultSet=stmt.getGeneratedKeys();
            if(keyResultSet!=null && keyResultSet.next()){
                ru.setId_rutina(keyResultSet.getInt(1));;
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
	
	
	public void update(Rutina rut) {
		PreparedStatement stmt= null;
		try {
			stmt=dbConnector.getInstancia().getConn().
					prepareStatement(
						"UPDATE rutina SET nombre = ?, comentario = ?, semanas=?, nivel=?   WHERE (id_rutina = ?)");
			
			stmt.setString(1, rut.getNombre());
			stmt.setString(2, rut.getComentario());
			stmt.setString(3, rut.getSemanas());
			stmt.setString(4, rut.getNivel());
			stmt.setInt(5, rut.getId_rutina());
				
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
	
	public void remove(Rutina rut) {
		PreparedStatement stmt= null;
		try {
			stmt=dbConnector.getInstancia().getConn().
					prepareStatement(
							"delete from rutina where id_rutina=?");
			stmt.setInt(1, rut.getId_rutina());
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
	
	public void setRutinas(Ejercicio eje) {
		PreparedStatement stmt=null;
		ResultSet rs=null;
		try {
			stmt=dbConnector.getInstancia().getConn().prepareStatement("select ru.*\r\n"
					+ "from rutina ru\r\n"
					+ "inner join rutina_ejercicio re\r\n"
					+ "	on ru.id_rutina=re.id_rutina\r\n"
					+ "where re.id_ejercicio=?");
			stmt.setInt(1, eje.getId_ejercicio());
			rs= stmt.executeQuery();
			if(rs!=null) {
				while(rs.next()) {
					Rutina p=new Rutina();
					p.setId_rutina(rs.getInt("id_rutina"));
					p.setNombre(rs.getString("nombre"));
					p.setComentario(rs.getString("comentario"));
					p.setNivel(rs.getString("nivel"));
					p.setSemanas(rs.getString("semanas"));
					
					eje.setRutinas(p);
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
	
	public void setRutinas(Plan plan) {
		PreparedStatement stmt=null;
		ResultSet rs=null;
		try {
			stmt=dbConnector.getInstancia().getConn().prepareStatement("select ru.*\r\n"
					+ "from rutina ru\r\n"
					+ "inner join plan_rutina pr\r\n"
					+ "	on ru.id_rutina=pr.id_rutina\r\n"
					+ "where pr.id_plan=?");
			stmt.setInt(1, plan.getId_plan());
			rs= stmt.executeQuery();
			if(rs!=null) {
				while(rs.next()) {
					Rutina p=new Rutina();
					p.setId_rutina(rs.getInt("id_rutina"));
					p.setNombre(rs.getString("nombre"));
					p.setComentario(rs.getString("comentario"));
					p.setNivel(rs.getString("nivel"));
					p.setSemanas(rs.getString("semanas"));
					
					plan.setRutinas(p);
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
