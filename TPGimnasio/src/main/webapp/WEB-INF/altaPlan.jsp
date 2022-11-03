<%@page import="entities.Plan"%>
<%@page import="entities.Usuario"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<%
Usuario userLogin =(Usuario)session.getAttribute("usuarioLogin");
Plan p =(Plan)request.getAttribute("plan");
%>

<!-- Bootstrap core CSS -->
<link href="style/bootstrap.css" rel="stylesheet">
<!-- Custom styles for this template -->
<style><%@include file="/WEB-INF/estilos/estilo.css"%></style>

</head>
<body>
<h2>Alta de un plan</h2>
<h2>usuario: <%=userLogin.getUsername() %></h2>

<div class="container">
	<form action="ABMCPlan" method="post">
	
			<div class="form-group  ">
				<label for="inputID" class=""> ID  Plan</label>
				<input id="inputID" name="idPlan" class="form-control "  type="number" required>
			</div>
			
			<div class="form-group  ">
				<label for="inputNombre" class=""> Nombre</label>
				<input id="inputNombre" name="name" class="form-control "  type="text" required>
			</div>
			
			<div class="form-group  ">
				<label for="inputDesc" class=""> Descripcion</label>
				<input id="inputDesc" name="description" class="form-control "  type="text" required>
			</div>
			
			
			<div class="form-group row ">
				<label for="inputFechaExpiracion" class="col-5">Fecha de expiracion</label>
				<input id="inputFechaExpiracion" name="fechaExpiracion" class="form-control col-5"  type="date" required>
			</div>
			
	 	
	 		<div class="form-group">
	 			<input type="hidden" class="custom-control-input"  name="idUserLogin" value="<%=userLogin.getId_usuario()%>">
	 			
	 			<input type="hidden" class="custom-control-input"  name="bandera" value="Modificado">
	 			<button type="submit" class="btn btn-warning" name="optionBM" value="alta">Enviar</button>
	 		</div>
	 	
	</form>

</div>

	
</body>
</html>