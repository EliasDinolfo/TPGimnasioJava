package ui;

import java.time.LocalDate;
import java.util.LinkedList;

import data.DataCosto;
import data.DataHorario;
import data.DataInstructor;
import data.DataPlan;
import data.DataUsuario;
import entities.Costo;
import entities.Horario;
import entities.Instructor;
import entities.Plan;
import entities.Usuario;
import logic.PlanesLogic;
import logic.UsuarioLogic;

public class Principal {

	@SuppressWarnings("null")
	public static void main(String[] args) {
		//este paquete se borrara en el futuro. ahora queda para probar la capa de logica
		
//		Menu menu=new Menu();
//		menu.start();
//		UsuarioLogic ctrlLogin =new UsuarioLogic();
//		DataUsuario du=new DataUsuario();
//		Usuario u = ctrlLogin.getById(23);
//		
//		u.setNombre("Mauro");
//		u.setApellido("Jimenez");
//		u.setTelefono("3413417150");
//		u.setTipo_doc("DNI");
//		u.setDireccion("Los Arrayanez 2417");
//		u.setDni("42144241");
//		u.setEmail("mauro@gmail.com");
//		u.setGenero("mascu");
//		u.setUsername("maurojjzz");
//		u.setContrasenia("123");
//		u.setFecha_nacimiento(LocalDate.parse("1999-10-08"));
//		
//		du.update(u);
//		System.out.println("modificado");
//		System.out.println(u);
//		System.out.println(ctrlLogin.getById(23));
		
		DataPlan dp=new DataPlan();
//		DataCosto dc=new DataCosto();
//		DataHorario dh= new DataHorario();
		DataInstructor insData= new DataInstructor();
		PlanesLogic ctp=new PlanesLogic();
		//System.out.println(ctp.getCostoActualPlan(dp.getById(99999)));
//		System.out.println(dc.getCosto());
//		Costo costo= ctp.getCostoActualPlan(dp.getById(99999)); 
		 
//		 if(costo != null){
//			 System.out.println(costo.getCosto());
//			 }else{
//				 System.out.println("no hay costo para este plan");
//		 }
		
		LinkedList<Instructor> horarios= new LinkedList<Instructor>();
		
		horarios.addAll(ctp.getInstructores(dp.getById(1)));
		
		System.out.println(horarios);
		
	} 
		
		
		
		
	}

