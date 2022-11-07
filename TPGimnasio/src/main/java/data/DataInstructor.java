package data;
import java.sql.*;
import java.time.LocalDate;
import java.util.LinkedList;
import entities.*;

public class DataInstructor {

	
	public LinkedList<Instructor> getAll(){
		DataPlan dp =new DataPlan();
		Statement stmt=null;
		ResultSet rs=null;
		LinkedList<Instructor> instructores= new LinkedList<>();
		try {
			stmt= dbConnector.getInstancia().getConn().createStatement();
			rs= stmt.executeQuery("select * from instructor");
			
			if(rs!=null) {
				while(rs.next()) {
					Instructor in=new Instructor();
					in.setDni(rs.getString("dni"));
					in.setTipo_doc(rs.getString("tipo_doc"));
					in.setNombre(rs.getString("nombre"));
					in.setApellido(rs.getString("apellido")); 
					in.setFecha_nacimiento(rs.getObject("fecha_nacimiento",LocalDate.class));
					in.setEmail(rs.getString("email"));
					in.setTelefono(rs.getString("telefono"));
					dp.setPlanes(in);
					
					
					
					
					instructores.add(in);
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
		return instructores;
	}
	
	public Instructor getByDni(String dni) {
		DataPlan dp=new DataPlan() ;
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
				dp.setPlanes(i);
				

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
							"update instructor set nombre=?,"
							+ "apellido=?, fecha_nacimiento=?, email=?, telefono=?"
							+ "where dni=?");
			
			stmt.setString(1, instructor.getNombre());
			stmt.setString(2, instructor.getApellido());
			stmt.setObject(3, instructor.getFecha_nacimiento());
			stmt.setString(4, instructor.getEmail());
			stmt.setString(5, instructor.getTelefono());
			
			stmt.setString(6, instructor.getDni());
				
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
	
	
	public void setInstructores(Plan plan) {
		PreparedStatement stmt=null;
		ResultSet rs=null;
		try {
			stmt=dbConnector.getInstancia().getConn().prepareStatement("select ins.*\r\n"
					+ "from instructor ins\r\n"
					+ "inner join plan_instructor pi\r\n"
					+ "	on ins.dni=pi.dni\r\n"
					+ "where pi.id_plan=?");
			stmt.setInt(1, plan.getId_plan());
			rs= stmt.executeQuery();
			if(rs!=null) {
				while(rs.next()) {
					Instructor p=new Instructor();
					p.setDni(rs.getString("dni"));
					p.setTipo_doc(rs.getString("tipo_doc"));
					p.setNombre(rs.getString("nombre"));
					p.setApellido(rs.getString("apellido"));
					p.setFecha_nacimiento(rs.getObject("fecha_nacimiento",LocalDate.class));
					p.setEmail(rs.getString("email"));
					p.setTelefono(rs.getString("telefono"));
					plan.setInstructores(p);
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
	
	public LinkedList<Instructor> getInstructoresPlanes(Plan p) {
		DataPlan dp =new DataPlan();
		PreparedStatement stmt=null;
		ResultSet rs=null;
		LinkedList<Instructor> instructores= new LinkedList<>();
		try {
			stmt=dbConnector.getInstancia().getConn().prepareStatement("select ins.*\r\n"
					+ "from instructor ins\r\n"
					+ "inner join plan_instructor pi\r\n"
					+ "	on ins.dni=pi.dni\r\n"
					+ "where pi.id_plan=?");
			stmt.setInt(1, p.getId_plan());
			rs= stmt.executeQuery();
			if(rs!=null) {
				while(rs.next()) {
					Instructor ins=new Instructor();
					ins.setDni(rs.getString("dni"));
					ins.setTipo_doc(rs.getString("tipo_doc"));
					ins.setNombre(rs.getString("nombre"));
					ins.setApellido(rs.getString("apellido"));
					ins.setFecha_nacimiento(rs.getObject("fecha_nacimiento",LocalDate.class));
					ins.setEmail(rs.getString("email"));
					ins.setTelefono(rs.getString("telefono"));
					
					instructores.add(ins);
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
		return instructores;
	}
	
	public void addrelacionPlanInstructor(Plan p) {
		PreparedStatement stmt= null;
		ResultSet keyResultSet=null;
		
		try {
			for(Instructor inst : p.getInstructores()) {
				
				stmt=dbConnector.getInstancia().getConn().
						prepareStatement(
							"insert into plan_instructor(dni, id_plan)"
							+" values(?,?)");
				stmt.setString(1, inst.getDni());
				stmt.setInt(2, p.getId_plan());
				stmt.executeUpdate();
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
	
	
	
	
}
