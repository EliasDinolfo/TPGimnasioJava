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
	<div class="comeabcck">
		<%@ include file="/WEB-INF/MenuContextualAdmin.jsp"%>
		
			<form action="Conexion" method="post">
				<input type="hidden" class="custom-control-input"  name="alta" value="voleralmenu">
				<input type="hidden" class="custom-control-input"  name="idUserLogin" value="<%=userLogin.getId_usuario()%>">
				<button class="btn btn-primary" type="submit" name="optionBM" value="planes">Volver</button>	

			</form>
	
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
		<h2>Costo del plan:
		
		 <%Costo costo= ctrlPlan.getCostoActualPlan(p); %>
		  
		   <%if(costo != null){%>
				$ <%=costo.getCosto() %>
				 <%}else{%>
					 Por el momento no hay informacion del costo de este plan. 
			<% }%>
			</h2>
	</div>
	
	  <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
</body>
</html>