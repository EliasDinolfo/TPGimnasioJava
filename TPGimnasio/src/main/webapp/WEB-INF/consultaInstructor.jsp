<%@page import="java.util.LinkedList"%>
<%@page import="entities.Usuario"%>
<%@page import="entities.Grupo_Musculo"%>
<%@page import="entities.Instructor"%>
<%@page import="entities.Plan"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="">
<meta name="author" content="">
   
 <%
 	Usuario userLogin =(Usuario)session.getAttribute("usuarioLogin");
	Instructor i =(Instructor)request.getAttribute("instructor");
 %>  
   
<title>1st jps-servlet testing</title>

<!-- Bootstrap core CSS -->
<link href="style/bootstrap.css" rel="stylesheet">
<!-- Custom styles for this template -->
<style><%@include file="/WEB-INF/estilos/estilo.css"%></style>
</head>
<body>
				
	<div class="container">
	<%@ include file="/WEB-INF/MenuContextualAdmin.jsp"%>
	<div class="dentro d-flex flex-column  justify-content-center align-items-center">
	
		
		<div class="row text-center">
			<div class="col text-center">
				<label class="font-weight-bold ">Nombre</label>
				<input class="form-control text-center bg-light" type="text" value="<%=i.getNombre() %>" disabled>
			</div>
			<div class="col text-center">
				<label class="font-weight-bold ">Apellido</label>
				<input class="form-control text-center bg-light" type="text" value="<%=i.getApellido() %>" disabled>
			</div>	
		</div>
	
		

		<div class="row text-center">
			<div class="col">
				<label class="font-weight-bold ">Telefono</label>
				<input class="form-control text-center bg-light" type="text" value="<%=i.getTelefono() %>" disabled>
			</div>
				
			
		</div>
		
		<div class="row text-center">
			<div class="col">
				<label class="font-weight-bold ">Tipo Documento</label>
				<input class="form-control text-center bg-light" type="text" value="<%=i.getTipo_doc()%>" disabled>
			</div>
			
			<div class="col">
				<label class="font-weight-bold ">DNI</label>
				<input class="form-control text-center bg-light" type="text" value="<%=i.getDni() %>" disabled>
			</div>	
		</div>
			
		
		
		<div class="row text-center">
			
				<label class="font-weight-bold ">E-Mail</label>
				<input class="form-control text-center bg-light" type="text" value="<%=i.getEmail() %>" disabled>
				
		</div>	
			
		
		<div class="row text-center mb-3">
			
			<div class="col">
				<label class="font-weight-bold ">Fecha Nacimiento</label>
				<input class="form-control text-center bg-light" type="date" value="<%=i.getFecha_nacimiento() %>" disabled>
			</div>
			
			
		</div>
		<div class="row">
			<div class="col-12 col-sm-12 col-lg-12">
	 					<caption>Lista de Planes:</caption>
	 					<% if(i.getPlanes().size()>0){ %>
	 					<table class="table table-responsive">
	 						<thead>
	 							<tr>
	 								<th>ID Plan</th>
	 								<th>Nombre</th>
	 								<th>Descripción</th>
	 								<th>Fecha de Expiración</th>
	 							</tr>
	 						</thead>
	 						<tbody>
	 						<%
									for (Plan plan : i.getPlanes()) {
									%>
									<tr>
										<td><%=plan.getId_plan()%></td>
										<td><%=plan.getNombre()%></td>
										<td><%=plan.getDescripcion()%></td>
										<td><%=plan.getFecha_expiracion()%></td>

									</tr>
									<%				
									}
									%>
								</tbody>

							</table>
					<% }
	 				else{
	 					out.print("No hay planes");
	 				}%>
					</div>	
			</div>
			<div class="botonn mb-3">
				<form action="ABMCInstructor" method="post">
						<input type="hidden" class="custom-control-input" name="idUserLogin" value="<%=userLogin.getId_usuario()%>">
						<input type="hidden" class="custom-control-input" name="dniInstructor" value="<%=i.getDni()%>">
						<input type="hidden" class="custom-control-input" name="bandera" value="aModificar">
						<button type="submit" class="btn btn-warning" name="optionBM" value="modificacion">Modificar</button>
				</form>
			</div>
											
			<div class="botonn mb-3">
				<form action="ABMCInstructor" method="post">
						<input type="hidden" class="custom-control-input" name="idUserLogin" value="<%=userLogin.getId_usuario()%>">
						<input type="hidden" class="custom-control-input" name="dniInstructor" value="<%=i.getDni()%>">
						<button type="submit" class="btn btn-danger" name="optionBM" value="baja">Eliminar</button>
				</form>
			</div>	
			<div class="botonn mb-3">
				<form action="ABMCInstructor" method="get">	
      				<button type="submit" class="btn btn-secondary">Volver</button>
      			</form>
    		</div>
	</div>
						
	</div>										
  <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>  						
</body>
</html>