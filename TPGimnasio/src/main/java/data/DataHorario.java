package data;

import java.sql.PreparedStatement;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.time.LocalTime;
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
}
