<%@page import="entities.Ejercicio"%>
<%@page import="entities.Rutina"%>
<%@page import="entities.Instructor"%>
<%@page import="entities.Horario"%>
<%@page import="java.util.LinkedList"%>
<%@page import="entities.Costo"%>
<%@page import="logic.PlanesLogic"%>
<%@page import="entities.Plan"%>
<%@page import="entities.Usuario"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<!-- Bootstrap core CSS -->
<link href="style/bootstrap.css" rel="stylesheet">
<!-- Custom styles for this template -->
<style><%@include file="/WEB-INF/estilos/consultaPlan.css"%></style>

<%
Usuario userLogin =(Usuario)session.getAttribute("usuarioLogin");
Plan p =(Plan)request.getAttribute("plan");
PlanesLogic ctrlPlan= new PlanesLogic();
%>
</head>
<body>
<%@ include file="/WEB-INF/MenuContextualAdmin.jsp"%>
	
		
		
	<div class="container">
	<div class="comeabcck">
		
		
			<form action="Conexion" method="post">
				<input type="hidden" class="custom-control-input"  name="alta" value="voleralmenu">
				<input type="hidden" class="custom-control-input"  name="idUserLogin" value="<%=userLogin.getId_usuario()%>">
				<button class="btn btn-primary" type="submit" name="optionBM" value="planes">Volver</button>	

			</form>
	
		</div>
	<div class="costosPlan">
			<h2>Costo mensual del plan:
		
					 <%Costo costo= ctrlPlan.getCostoActualPlan(p); %>
		  
		  				 <%if(costo != null){%>
							$ <%=costo.getCosto() %>
						 <%}else{%>
					 		Por el momento no hay informacion del costo de este plan. 
					<% }%>
			</h2>
		</div>
	</div>	
		
	<div class="container d-flex flex-row justify-content-around align-items-center mt-3 pb-3 pt-3"> <!--     -->
	
	<div class="dentro d-flex flex-column  justify-content-center align-items-start"> <!--  -->
	
		<div class="row text-center">
			<div class="col">
				<label  class="font-weight-bold">ID</label>
				<input class="form-control text-center bg-light" type="text" value="<%=p.getId_plan() %>" disabled>
			</div>
			<div class="col text-center">
				<label class="font-weight-bold ">Nombre</label>
				<input class="form-control text-center bg-light" type="text" value="<%=p.getNombre() %>" disabled>
			</div>
			<div class="col text-center">
				<label class="font-weight-bold ">Fecha Expiracion</label>
				<input class="form-control text-center bg-light" type="date" value="<%=p.getFecha_expiracion() %>" disabled>
			</div>	
		</div>
		
		
		<div class="row text-center">
			<div class="col text-center inputdesc">
				<label class="font-weight-bold ">Descripcion</label>
				<input class="form-control text-center bg-light" type="text" value="<%=p.getDescripcion() %>" disabled>
			</div>
				
		</div>

			
	</div>
	
	<div class="dentro ">
		<div class=" mb-3">
				<form action="ABMCPlan" method="post">
						<input type="hidden" class="custom-control-input" name="idUserLogin" value="<%=userLogin.getId_usuario()%>">
						<input type="hidden" class="custom-control-input" name="idPlan" value="<%=p.getId_plan()%>">
						<input type="hidden" class="custom-control-input" name="bandera" value="aModificar">
						<button type="submit" class="btn botonn btn-warning" name="optionBM" value="modificacion">Modificar</button>
				</form>
			</div>
											
			<div >
				<form action="ABMCPlan" method="post">
						<input type="hidden" class="custom-control-input" name="idUserLogin" value="<%=userLogin.getId_usuario()%>">
						<input type="hidden" class="custom-control-input" name="idPlan" value="<%=p.getId_plan()%>">
						<button type="submit" class="btn botonn btn-danger" name="optionBM" value="baja">Eliminar</button>
				</form>
			</div>
	</div>
						
											
	</div>
	
	<div class="container mt-3">
	
		
		
		<div class="horariosPlan py-3">
			<h2>Clases</h2>
			<%LinkedList<Horario> horarios= ctrlPlan.getHorarios(p); %>
			
			<%if(horarios.size()!=0){%>
			<div class="table-responsive">
				<table class="table table-light  table-bordered">
					<thead class="table-dark">
						<tr>
							<th> Dias</th>
	 						<th> Hora Inicio</th>
	 						<th> Hora fin</th>
						</tr>
	 					

					</thead>
					
				 	<tbody >
				 		<%for (Horario hs : horarios) {%>
				 		<tr>
				 		
				 				<td><%=hs.getDias_semana()%></td>
								<td><%=hs.getHora_inicio()%></td>
								<td><%=hs.getHora_fin()%></td>
				 		</tr>
				 				
										
				 		<%} %>
				 	</tbody>
				</table>
			</div>
			<%}else{ %>
				<h3>Por el momento no hay informacion del horario de este plan</h3>
			<%} %>
		</div>
		
		<div class="instructoresPlan">
			<h2>Instructores</h2>
			<%LinkedList<Instructor> instructores= ctrlPlan.getInstructores(p); %>
			<%if(instructores.size()!=0){%>
			<div class="table-responsive">
				<table class="table table-light  table-bordered">
					<thead class="table-dark">
						<tr>
							<th>Nombre</th>
	 						<th>Apellido</th>
	 						<th>Tipo Doc.</th>
	 						<th>DNI</th>
	 						<th>E-mail</th>
	 						<th>Telefono</th>
						</tr>
	 					

					</thead>
					
				 	<tbody >
				 		<%for (Instructor ins : instructores) {%>
				 		<tr>
				 		
				 				<td><%=ins.getNombre()%></td>
								<td><%=ins.getApellido()%></td>
								<td><%=ins.getTipo_doc()%></td>
								<td><%=ins.getDni()%></td>
								<td><%=ins.getEmail()%></td>
								<td><%=ins.getTelefono()%></td>
				 		</tr>
				 				
										
				 		<%} %>
				 	</tbody>
				</table>
			</div>
			<%}else{ %>
				<h3>Por el momento no hay informacion de instructores en este plan</h3>
			<%} %>
		</div>
			
			
			
	</div>
	
	
	<div class="container mt-3 RutinaYejer"> 
		<h2>Rutinas y ejercicios</h2>
		<%LinkedList<Rutina> rutinas= ctrlPlan.getRutinas(p); %>
		<%if(rutinas.size()!=0){%>
		
			<%for (Rutina rut : rutinas) {%>
				<div class="table tablaRut my-2">
					<table class="table ">	
						<thead class="">
							<tr>
								<th>Rutina</th>
	 							<th>Nivel</th>
	 							<th>Comentario</th>
	 						</tr>
	 					
						</thead>
				 		<tbody >
				 			<tr>
				 				<td><%=rut.getNombre()%></td>
								<td><%=rut.getNivel()%></td>
								<td><%=rut.getComentario()%></td>
							</tr>
							</tbody>
						</table>
					</div>
					
					
					
					<div class="ejer p-4 d-flex flex-row flex-wrap justify-content-center">
					
				 			<%LinkedList<Ejercicio> ejercicios=new LinkedList<Ejercicio>();
				 			ejercicios.addAll(rut.getEjercicios());
				 			for (Ejercicio ej : ejercicios){%>
				 				
				 				<div class="card mx-2 mt-2" style="width: 18rem;">
 					 					<img src="<%=ej.getImagen() %>" class="card-img-top" alt="...">
  										<div class="card-body">
   											<h5 class="card-title"><%=ej.getNombre() %></h5>
    										<p class="card-text"><%=ej.getComentario() %></p>
 										 </div>
								</div>
				 				<%} %>
							</div>		
				 		<%} %>
				 		
					
			
			<%}else{ %>
				<h3>Por el momento no hay informacion de las rutinas en este plan</h3>
			<%} %>
			
		
	</div>
	
	<div class="container mt-3">
			<h2>Usuarios inscriptos en el plan</h2>
			<%LinkedList<Usuario> usuarios= ctrlPlan.getUsuariosPlan(p); %>
			<%if(usuarios.size()!=0){%>
			<div class="table-responsive">
				<table class="table table-light  table-bordered">
					<thead class="table-dark">
						<tr>
							<th>Alumno</th>
	 						<th>User</th>
	 						<th>E-mail</th>
	 						<th>Tipo Doc.</th>
	 						<th>DNI</th>
	 						<th>Telefono</th>
	 						<th>Sexo</th>
	 						<th>Fecha Nacimiento</th>
	 						<th>Direccion</th>
						</tr>
	 					

					</thead>
					
				 	<tbody >
				 		<%for (Usuario u : usuarios) {%>
				 		<tr>
				 		
				 				<td><%=u.getNombre()%> <%=u.getApellido()%></td>
								<td><%=u.getUsername()%></td>
								<td><%=u.getEmail()%></td>
								<td><%=u.getTipo_doc()%></td>
								<td><%=u.getDni()%></td>
								<td><%=u.getTelefono()%></td>
								<td><%=u.getGenero()%></td>
								<td><%=u.getFecha_nacimiento()%></td>
								<td><%=u.getDireccion()%></td>
				 		</tr>
				 				
										
				 		<%} %>
				 	</tbody>
				</table>
			</div>
			<%}else{ %>
				<h3>Por el momento no hay usuarios inscriptos en este plan en este momento</h3>
			<%} %>
			
		
	</div>
	
	
	
	
	
	
	
	
	
<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
</body>
</html>