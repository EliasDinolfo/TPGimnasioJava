<%@page import="entities.Usuario"%>
<%@page import="entities.Instructor"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>

<link rel="stylesheet" href="style/styles.css">
<link href="style/bootstrap.css" rel="stylesheet">
<%
 	Usuario userLogin =(Usuario)session.getAttribute("usuarioLogin");
	Instructor i =(Instructor)request.getAttribute("instructor");
 %>

</head>
<body>
		<div class="container  ">
		<%@ include file="/WEB-INF/MenuContextualAdmin.jsp"%>
		<div <%= request.getAttribute("mensaje")==null ? "hidden": ""%> class="alert alert-danger alert-dismissible">
            <p><%= request.getAttribute("mensaje") %></p>
            <button type="button" class="close" data-dismiss="alert">
              <span>x</span>
            </button>
   		 </div>      
		<h1 class="text-center mt-2">Registro instructor</h1>
		
		<form action="ABMCInstructor" method="post" class="form-registro ">
		<input type="hidden" class="custom-control-input" name="optionBM" value="alta">
		<input type="hidden" class="custom-control-input" name="bandera" value="a?adido">
		<input type="hidden" class="custom-control-input" name="idUserLogin" value="<%=userLogin.getId_usuario()%>">
			<div class="form-group row ">
				<label for="inputDni" class="col-2"> Dni</label>
				<input id="inputDni" name="dni" class="form-control col-8"  type="number" required>
			</div>
			
			<div class="form-group row">
				<label for="selectTipoDoc" name="lblTipoDoc" class="col-2">Tipo documento</label>
				<select class="form-select col-3" name="selectTipoDoc">
					<option selected> Seleccione uno</option>
					<option value="dni">DNI</option>
					<option value="pasaporte">Pasaporte</option>
					<option value="libretaCivica">Libreta Civica</option>
				</select>
			</div>
			
			<div class="form-group row ">
				<label for="inputNombre" class="col-2"> Nombre</label>
				<input id="inputNombre" name="nombre" class="form-control col-8"  type="text">
			</div>
			
			<div class="form-group row ">
				<label for="inputApellido" class="col-2"> Apellido</label>
				<input id="inputApellido" name="apellido" class="form-control col-8"  type="text">
			</div>
			
			<div class="form-group row ">
				<label for="inputTelefono" class="col-2"> Telefono</label>
				<input id="inputTelefono" name="telefono" class="form-control col-8"  type="number">
			</div>
						
			
			<div class="form-group row ">
				<label for="inputEmail" class="col-2"> Email</label>
				<input id="inputEmail" name="email" class="form-control col-8"  type="email">
			</div>
			
			<div class="form-group row ">
				<label for="inputFechaNacimiento" class="col-2">Fecha de nacimiento</label>
				<input id="inputFechaNacimiento" name="fechaNacimiento" class="form-control col-8"  type="date" required>
			</div>
			
			
			<div class="col-auto">
      			<button type="submit" class="btn btn-primary mb-2">Agregar</button>
    		</div>		
		</form>
		<form action="ABMCInstructor" method="get">
			<div class="col-auto">
      			<button type="submit" class="btn btn-secondary mb-2">Volver</button>
    		</div>
		</form>
	</div>
  <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>  
</body>
</html>