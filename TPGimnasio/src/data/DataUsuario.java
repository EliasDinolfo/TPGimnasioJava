package data;
import java.sql.*;
import java.time.LocalDate;
import java.util.LinkedList;
import entities.*;

public class DataUsuario {
	
	
	public LinkedList<Usuario> getAll(){
		Statement stmt=null;
		ResultSet rs=null;
		DataRol dr= new DataRol();
		DataPlan dp= new DataPlan();
		LinkedList<Usuario> usuarios= new LinkedList<>();
		try {
			stmt= dbConnector.getInstancia().getConn().createStatement();
			rs= stmt.executeQuery("select * from usuario");
			
			if(rs!=null) {
				while(rs.next()) {
					Usuario u=new Usuario();
					u.setId_usuario(rs.getInt("id_usuario"));
					u.setNombre(rs.getString("nombre"));
					u.setApellido(rs.getString("apellido"));
					u.setTelefono(rs.getString("telefono"));
					u.setTipo_doc(rs.getString("tipo_doc"));
					u.setDni(rs.getString("dni"));
					u.setEmail(rs.getString("email"));
					u.setGenero(rs.getString("genero"));
					u.setUsername(rs.getString("username"));
					u.setContrasenia(rs.getString("password"));
					u.setDireccion(rs.getString("direccion"));
					u.setFecha_nacimiento(rs.getObject("fecha_nacimiento",LocalDate.class));
					u.setRol(dr.getById(rs.getInt("id_rol")));
					dp.setPlanes(u);
					usuarios.add(u);
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
		return usuarios;
	}
	
	public Usuario getById(int id) {
		DataRol dr= new DataRol();
		DataPlan dp= new DataPlan();
		Usuario u=null;
		PreparedStatement stmt=null;
		ResultSet rs=null;
		try {
			stmt=dbConnector.getInstancia().getConn().prepareStatement(
					"select * from usuario where id_usuario=?"
					);
			stmt.setInt(1, id);
			rs=stmt.executeQuery();
			if(rs!=null && rs.next()) {
				u=new Usuario();
				
				u.setId_usuario(rs.getInt("id_usuario"));
				u.setNombre(rs.getString("nombre"));
				u.setApellido(rs.getString("apellido"));
				u.setTelefono(rs.getString("telefono"));
				u.setTipo_doc(rs.getString("tipo_doc"));
				u.setDni(rs.getString("dni"));
				u.setEmail(rs.getString("email"));
				u.setGenero(rs.getString("genero"));
				u.setUsername(rs.getString("username"));
				u.setContrasenia(rs.getString("password"));
				u.setDireccion(rs.getString("direccion"));
				u.setFecha_nacimiento(rs.getObject("fecha_nacimiento",LocalDate.class));
				u.setRol(dr.getById(rs.getInt("id_rol")));
				dp.setPlanes(u);
				
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
		
		return u;
	}
	
	public void add(Usuario u) {
		PreparedStatement stmt= null;
		ResultSet keyResultSet=null;
		try {
			stmt=dbConnector.getInstancia().getConn().
					prepareStatement(
							"insert into usuario(nombre,apellido,telefono,tipo_doc,"
							+ "dni,email,genero,username,password,direccion,"
							+ "id_rol,fecha_nacimiento) "
							+ "values(?,?,?,?,?,?,?,?,?,?,?,?)",
							PreparedStatement.RETURN_GENERATED_KEYS);
			stmt.setString(1, u.getNombre());
			stmt.setString(2, u.getApellido());
			stmt.setString(3, u.getTelefono());
			stmt.setString(4, u.getTipo_doc());
			stmt.setString(5, u.getDni());
			stmt.setString(6, u.getEmail());
			stmt.setString(7, u.getGenero());
			stmt.setString(8, u.getUsername());
			stmt.setString(9, u.getContrasenia());
			stmt.setString(10, u.getDireccion());
			stmt.setInt(11, u.getRol().getId_rol());
			stmt.setObject(12, u.getFecha_nacimiento());
			stmt.executeUpdate();
			
			keyResultSet=stmt.getGeneratedKeys();
            if(keyResultSet!=null && keyResultSet.next()){
                u.setId_usuario(keyResultSet.getInt(1));
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
	
	public void update(Usuario usuario) {
		PreparedStatement stmt= null;
		try {
			stmt=dbConnector.getInstancia().getConn().
					prepareStatement(
							"update usuario set nombre=?, apellido=?, telefono=?,"
							+ "tipo_doc=?, dni=?, email=?, genero=?, username=?, password=?,"
							+ "direccion=? id_rol=?, fecha_nacimiento=?"
							+ "where id_usuario=?");
			stmt.setString(1, usuario.getNombre());
			stmt.setString(2, usuario.getApellido());
			stmt.setString(3, usuario.getTelefono());
			stmt.setString(4, usuario.getTipo_doc());
			stmt.setString(5, usuario.getDni());
			stmt.setString(6, usuario.getEmail());
			stmt.setString(7, usuario.getGenero());
			stmt.setString(8, usuario.getUsername());
			stmt.setString(9, usuario.getContrasenia());
			stmt.setString(10, usuario.getDireccion());
			stmt.setInt(11, usuario.getRol().getId_rol());
			stmt.setObject(12, usuario.getFecha_nacimiento());
			stmt.setInt(13, usuario.getId_usuario());
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
	
	public void remove(Usuario usuario) {
		PreparedStatement stmt= null;
		try {
			stmt=dbConnector.getInstancia().getConn().
					prepareStatement(
							"delete from usuario where id_usuario=?");
			stmt.setInt(1, usuario.getId_usuario());
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
	
	public void setUsuarios(Plan plan) {
		PreparedStatement stmt=null;
		ResultSet rs=null;
		try {
			stmt=dbConnector.getInstancia().getConn().prepareStatement("select usu.*\r\n"
					+ "from usuario usu\r\n"
					+ "inner join usuario_plan up\r\n"
					+ "	on usu.id_usuario=up.id_usuario\r\n"
					+ "where up.id_plan=?");
			stmt.setInt(1, plan.getId_plan());
			rs= stmt.executeQuery();
			if(rs!=null) {
				while(rs.next()) {
					Usuario p=new Usuario();
					p.setId_usuario(rs.getInt("id_usuario"));
					p.setNombre(rs.getString("nombre"));
					p.setApellido(rs.getString("apellido"));
					p.setTelefono(rs.getString("telefono"));
					p.setTipo_doc(rs.getString("tipo_doc"));
					p.setDni(rs.getString("dni"));
					p.setEmail(rs.getString("email"));
					p.setGenero(rs.getString("genero"));
					p.setUsername(rs.getString("username"));
					p.setContrasenia(rs.getString("password"));
					p.setDireccion(rs.getString("direccion"));
					
					plan.setUsuarios(p);
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


