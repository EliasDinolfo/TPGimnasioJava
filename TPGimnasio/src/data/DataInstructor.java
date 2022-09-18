package data;
import java.sql.*;
import java.time.LocalDate;
import java.util.LinkedList;
import entities.*;

public class DataInstructor {

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
	public Instructor getByDni(String dni) {
		
		Instructor i=null;
		
		PreparedStatement stmt=null;
		ResultSet rs=null;
		try {
			stmt=dbConnector.getInstancia().getConn().prepareStatement(
					"select * from instructor where dni=?"
					);
			stmt.setString(1, dni);
			rs=stmt.executeQuery();
			if(rs!=null && rs.next()) {
				i=new Instructor();
				i.setDni(rs.getString("dni"));
				i.setTipo_doc(rs.getString("tipo_doc"));
				i.setNombre(rs.getString("nombre"));
				i.setApellido(rs.getString("apellido"));
				i.setFecha_nacimiento(rs.getObject("fecha_nacimiento",LocalDate.class));
				i.setEmail(rs.getString("email"));
				i.setTelefono(rs.getString("telefono"));

//				u.setRol(dr.getById(rs.getInt("id_rol")));
//				u.setPlan(dp.getById(rs.getInt("id_plan")));
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
		
		return i;
	}
	
	public void add(Instructor ins) {
		PreparedStatement stmt= null;
		ResultSet keyResultSet=null;
		try {
			stmt=dbConnector.getInstancia().getConn().
					prepareStatement(
							"insert into instructor(dni, tipo_doc, nombre, apellido, fecha_nacimiento,"
							+ "email, telefono) values(?,?,?,?,?,?,?)");
			stmt.setString(1, ins.getDni());
			stmt.setString(2, ins.getTipo_doc());
			stmt.setString(3, ins.getNombre());
			stmt.setString(4, ins.getApellido());
			stmt.setObject(5, ins.getFecha_nacimiento());
			stmt.setString(6, ins.getEmail());
			stmt.setString(7, ins.getTelefono());
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
	
	
	public void update(Instructor instructor) {
		PreparedStatement stmt= null;
		try {
			stmt=dbConnector.getInstancia().getConn().
					prepareStatement(
							"update instructor set tipo_doc=?, nombre=?,"
							+ "apellido=?, fecha_nacimiento=?, email=?, telefono=?"
							+ "where dni=?");
			
			stmt.setString(1, instructor.getTipo_doc());
			stmt.setString(2, instructor.getNombre());
			stmt.setString(3, instructor.getApellido());
			stmt.setObject(4, instructor.getFecha_nacimiento());
			stmt.setString(5, instructor.getEmail());
			stmt.setString(6, instructor.getTelefono());
			
			stmt.setString(7, instructor.getDni());
				
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
	
	public void remove(Instructor ins) {
		PreparedStatement stmt= null;
		try {
			stmt=dbConnector.getInstancia().getConn().
					prepareStatement(
							"delete from instructor where dni=?");
			stmt.setString(1, ins.getDni());
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
