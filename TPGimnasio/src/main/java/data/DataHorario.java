package data;

import java.sql.PreparedStatement;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.time.LocalDate;
import java.time.LocalTime;
import java.util.LinkedList;

import entities.Costo;
import entities.Horario;
import entities.Plan;

public class DataHorario {
	public void setHorarios(Plan plan) {
		PreparedStatement stmt=null;
		ResultSet rs=null;
		try {
			stmt=dbConnector.getInstancia().getConn().prepareStatement("select *\r\n"
					+ "from horario\r\n"
					+ "where id_plan=?");
			stmt.setInt(1, plan.getId_plan());
			rs= stmt.executeQuery();
			if(rs!=null) {
				while(rs.next()) {
					Horario h=new Horario();
					h.setHora_inicio(rs.getObject("hora_inicio",LocalTime.class));
					h.setHora_fin(rs.getObject("hora_fin",LocalTime.class));
					h.setDias_semana(rs.getString("dias_semana"));
					
					plan.setHorarios(h);
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
	
	
	
public LinkedList<Horario> getHorarios(Plan p) {
		
		LinkedList<Horario> horarios= new LinkedList<Horario>();
		PreparedStatement stmt=null;
		ResultSet rs=null;
		try {
			stmt=dbConnector.getInstancia().getConn().prepareStatement(
					"SELECT * FROM gimnasio.horario\r\n"
					+ "where id_plan=?"
					);
			stmt.setInt(1, p.getId_plan());
			rs=stmt.executeQuery();
			if(rs!=null ) {
				while(rs.next()) {
				Horario h=new Horario();
				h.setDias_semana(rs.getString("dias_semana"));
				h.setHora_inicio(rs.getObject("hora_inicio",LocalTime.class));
				h.setHora_fin((rs.getObject("hora_fin",LocalTime.class)));
				h.setPlan(p);
				horarios.add(h);
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
//		if (costos.size()>0) {
//			return costos;
//		}else {
//			
//			costos=null;
//			return costos;
//		}
		return horarios;
		
	}

public void addHorarioPlanes(Plan p) {
	PreparedStatement stmt= null;
	ResultSet keyResultSet=null;
	try {
		
		stmt=dbConnector.getInstancia().getConn().
				prepareStatement(
						"insert into horario(hora_inicio,hora_fin,dias_semana,id_plan) "
						+ "values(?,?,?,?)");
		stmt.setObject(1, p.getHorarios().getFirst().getHora_inicio());
		stmt.setObject(2, p.getHorarios().getFirst().getHora_fin());
		stmt.setString(3, p.getHorarios().getFirst().getDias_semana());
		stmt.setInt(4, p.getId_plan());
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
