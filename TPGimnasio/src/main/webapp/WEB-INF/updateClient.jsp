<%@page import="entities.Usuario"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<link href="style/bootstrap.css" rel="stylesheet">
<%
 	Usuario userLogin =(Usuario)session.getAttribute("usuarioLogin");
	Usuario u =(Usuario)request.getAttribute("usuario");
 	//LinkedList<Usuario> userlist=(LinkedList<Usuario>)request.getAttribute("listaUsuarios");
 %>
</head>
<body>
	<%@ include file="/WEB-INF/MenuContextualAdmin.jsp"%>
	<h1>Modificacion</h1>
	<div class="container">
	<!-- cambiarmos el username de un user -->
	
	
	<form action="ABMCUsuario" method="post">
	
		<div class="form-group  ">
				<label for="inputNombre" class="" > Nombre</label>
				<input id="inputNombre" name="name" class="form-control " value="<%=u.getNombre()%>" type="text" required>
			</div>
			
			<div class="form-group  ">
				<label for="inputApellido" class=""> Apellido</label>
				<input id="inputApellido" name="surname" class="form-control " value="<%=u.getApellido() %>" type="text">
			</div>
			
			<div class="form-group ">
				<label for="inputTelefono" class=""> Telefono</label>
				<input id="inputTelefono" name="telephone" class="form-control" value="<%=u.getTelefono()%>"  type="text">
			</div>
			
			<div class="form-group row ">
				<label for="inputEmail" class="col-2"> Email</label>
				<input id="inputEmail" name="email" class="form-control col-8" value="<%=u.getEmail() %>" type="email">
			</div>
		<div class="form-group">
				<label for="selectTipoDoc" name="lblTipoDoc"> Tipo documento</label>
				<select class="form-select" name="selectTipoDoc" required>
					<option selected> Seleccione uno</option>
					<option value="dni">DNI</option>
					<option value="pasaporte">Pasaporte</option>
					<option value="libretaCivica">Libreta Civica</option>
				</select>
			</div>
			
			
			<div class="form-group row ">
				<label for="inputDni" class="col-3"> Numero DNI </label>
				<input id="inputDni" name="dni" class="form-control col-7"  value="<%=u.getDni() %>" type="number">
			</div>
			
			
			
			<div class="form-group">
				<label for="selectGenero" name="lblGenero"> Sexo</label>
				<select class="form-select" name="selectGenero"  required>
					<option selected> Seleccione uno</option>
					<option value="femenino">Femenino</option>
					<option value="masculino">Masculino</option>
					<option value="noBinario">No Binario</option>
					<option value="notAnswer">Prefiero no decirlo</option>
					<option value="UNDEFINED">Otro</option>
				</select>
			</div>
			
			
			<div class="form-group row ">
				<label for="inputDireccion" class="col-2">Direccion</label>
				<input id="inputDireccion" name="direccion" class="form-control col-8" value="<%=u.getDireccion() %>" type="text" required>
			</div>
			
			<div class="form-group row ">
				<label for="inputFechaNacimiento" class="col-5">Fecha de nacimiento</label>
				<input id="inputFechaNacimiento" name="fechaNacimiento" class="form-control col-5" value="<%=u.getFecha_nacimiento() %>" type="date" required>
			</div>
			
			
			<div class="form-group row ">
				<label for="inputUsername" class="col-4"> Nombre de usuario</label>
				<input id="inputUsername" name="username" class="form-control col-6" value="<%=u.getUsername() %>" type="text" required>
			</div>
			
			<div class="form-group row ">
				<label for="inputPassword" class="col-3"> Contraseña</label>
				<input id="inputPassword" name="password" class="form-control col-7" value="<%=u.getContrasenia() %>" type="password" required>
			</div>
			
			<div class="form-group row ">
				<label for="inputPasswordTwo" class="col-3"> Repita Contraseña</label>
				<input id="inputPasswordTwo" name="passwordTwo" class="form-control col-7" value="<%=u.getContrasenia() %>" type="password" required>
			</div>
	
	
		<div class="form-group">
	 		<input type="hidden" class="custom-control-input"  name="idUserLogin" value="<%=userLogin.getId_usuario()%>">
	 		<input type="hidden" class="custom-control-input"  name="idUser" value="<%=u.getId_usuario()%>">
	 		<input type="hidden" class="custom-control-input"  name="bandera" value="Modificado">
	 		<button type="submit" class="btn btn-warning" name="optionBM" value="modificacion">Modificar</button>
	 	</div>
	 	
	 </form>
	 
	 </div>
	   <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>  
	 
</body>
</html>