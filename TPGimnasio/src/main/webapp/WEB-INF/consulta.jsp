<%@page import="java.util.LinkedList"%>
<%@page import="entities.Usuario"%>
<%@page import="entities.Grupo_Musculo"%>
<%@page import="entities.Instructor"%>
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
	Usuario u =(Usuario)request.getAttribute("usuario");
 %>  
   
<title>1st jps-servlet testing</title>

<!-- Bootstrap core CSS -->
<link href="style/bootstrap.css" rel="stylesheet">
<!-- Custom styles for this template -->
<style><%@include file="/WEB-INF/estilos/estilo.css"%></style>
</head>
<body>
		
		
		
		
		
		
		<div class="comeabcck">
		<%@ include file="/WEB-INF/MenuContextualAdmin.jsp"%>
			<form action="Conexion" method="post">

				<input type="hidden" class="custom-control-input"  name="idUserLogin" value="<%=userLogin.getId_usuario()%>">
				<button class="btn btn-primary" type="submit" name="optionBM" value="firstlog">Volver</button>	

			</form>
	
		</div>
	<div class="container d-flex flex-column  justify-content-center align-items-center">
	
	<div class="dentro d-flex flex-column  justify-content-center align-items-center">
	
		<div class="row text-center">
			<div class="col">
				<label  class="font-weight-bold">ID</label>
				<input class="form-control text-center bg-light" type="text" value="<%=u.getId_usuario() %>" disabled>
			</div>
				
		</div>
		
		<div class="row text-center">
			<div class="col text-center">
				<label class="font-weight-bold ">User</label>
				<input class="form-control text-center bg-light" type="text" value="<%=u.getUsername() %>" disabled>
			</div>
				
		</div>
	
		
		<div class="row text-center">
			<div class="col">
				<label class="font-weight-bold ">Nombre</label>
				<input class="form-control text-center bg-light" type="text" value="<%=u.getNombre() %>" disabled>
			</div>
			
			<div class="col">
				<label class="font-weight-bold ">Apellido</label>
				<input class="form-control text-center bg-light" type="text" value="<%=u.getApellido() %>" disabled>
			</div>
			
		</div>
		
		<div class="row text-center">
			<div class="col">
				<label class="font-weight-bold ">Telefono</label>
				<input class="form-control text-center bg-light" type="text" value="<%=u.getTelefono() %>" disabled>
			</div>
			
			
			
		</div>
		
		<div class="row text-center">
			<div class="col">
				<label class="font-weight-bold ">Tipo Documento</label>
				<input class="form-control text-center bg-light" type="text" value="<%=u.getTipo_doc()%>" disabled>
			</div>
			
			<div class="col">
				<label class="font-weight-bold ">DNI</label>
				<input class="form-control text-center bg-light" type="text" value="<%=u.getDni() %>" disabled>
			</div>	
		</div>
			
		
		
		<div class="row text-center">
			
				<label class="font-weight-bold ">E-Mail</label>
				<input class="form-control text-center bg-light" type="text" value="<%=u.getEmail() %>" disabled>
			
			
			
			
		</div>
		
		<div class="row text-center">
			<div class="col">
				<label class="font-weight-bold ">Sexo</label>
				<input class="form-control text-center bg-light" type="text" value="<%=u.getGenero() %>" disabled>
			</div>
			
			
		</div>
		
		<div class="row text-center">
			<div class="col">
				<label class="font-weight-bold ">Direccion</label>
				<input class="form-control text-center bg-light" type="text" value="<%=u.getDireccion() %>" disabled>
			</div>

		</div>
			
		
		<div class="row text-center mb-3">
			
			<div class="col">
				<label class="font-weight-bold ">Fecha Nacimiento</label>
				<input class="form-control text-center bg-light" type="text" value="<%=u.getFecha_nacimiento() %>" disabled>
			</div>
			
			
		</div>
			
			
			<div class="botonn mb-3">
				<form action="ABMCUsuario" method="post">
						<input type="hidden" class="custom-control-input" name="idUserLogin" value="<%=userLogin.getId_usuario()%>">
						<input type="hidden" class="custom-control-input" name="idUser" value="<%=u.getId_usuario()%>">
						<input type="hidden" class="custom-control-input" name="bandera" value="aModificar">
						<button type="submit" class="btn btn-warning" name="optionBM" value="modificacion">Modificar</button>
				</form>
			</div>
											
			<div class="botonn">
				<form action="ABMCUsuario" method="post">
						<input type="hidden" class="custom-control-input" name="idUserLogin" value="<%=userLogin.getId_usuario()%>">
						<input type="hidden" class="custom-control-input" name="idUser" value="<%=u.getId_usuario()%>">
						<button type="submit" class="btn btn-danger" name="optionBM" value="baja">Eliminar</button>
				</form>
			</div>
			
			
			
	</div>
						
											
	</div>
	
	  <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>  	
		
</body>
</html>