<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>

<meta charset="ISO-8859-1">
<title>Registro</title>
<link rel="stylesheet" href="style/styles.css">
<link href="style/bootstrap.css" rel="stylesheet">

</head>
<body>
	
	<!-- ID rol se asigna automaticamente el de usuario. nro ID es autoincremental -->
	
	<div class="container  ">
		<div <%= request.getAttribute("mensaje")==null ? "hidden": ""%> class="alert alert-danger alert-dismissible">
            <p><%= request.getAttribute("mensaje") %></p>
            <button type="button" class="close" data-dismiss="alert">
              <span>x</span>
            </button>
   		 </div>      
		<h1 class="text-center">Registro</h1>
		<form action="registro" method="post" class="form-registro ">
		
			<div class="form-group row ">
				<label for="inputNombre" class="col-2"> Nombre</label>
				<input id="inputNombre" name="name" class="form-control col-8"  type="text" required>
			</div>
			
			<div class="form-group row ">
				<label for="inputApellido" class="col-2"> Apellido</label>
				<input id="inputApellido" name="surname" class="form-control col-8"  type="text">
			</div>
			
			<div class="form-group row ">
				<label for="inputTelefono" class="col-2"> Telefono</label>
				<input id="inputTelefono" name="telephone" class="form-control col-8"  type="number">
			</div>
			
			<div class="form-group">
				<label for="selectTipoDoc" name="lblTipoDoc"> Tipo documento</label>
				<select class="form-select" name="selectTipoDoc">
					<option selected> Seleccione uno</option>
					<option value="dni">DNI</option>
					<option value="pasaporte">Pasaporte</option>
					<option value="libretaCivica">Libreta Civica</option>
				</select>
			</div>
			
			<div class="form-group row ">
				<label for="inputDni" class="col-3"> Numero DNI </label>
				<input id="inputDni" name="dni" class="form-control col-7"  type="number">
			</div>
			
			<div class="form-group row ">
				<label for="inputEmail" class="col-2"> Email</label>
				<input id="inputEmail" name="email" class="form-control col-8"  type="email">
			</div>
			
			<div class="form-group">
				<label for="selectGenero" name="lblGenero"> Sexo</label>
				<select class="form-select" name="selectGenero">
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
				<input id="inputDireccion" name="direccion" class="form-control col-8"  type="text" required>
			</div>
			
			<div class="form-group row ">
				<label for="inputFechaNacimiento" class="col-5">Fecha de nacimiento</label>
				<input id="inputFechaNacimiento" name="fechaNacimiento" class="form-control col-5"  type="date" required>
			</div>
			
			
			<div class="form-group row ">
				<label for="inputUsername" class="col-4"> Nombre de usuario</label>
				<input id="inputUsername" name="username" class="form-control col-6"  type="text" required>
			</div>
			
			<div class="form-group row ">
				<label for="inputPassword" class="col-3"> Contraseña</label>
				<input id="inputPassword" name="password" class="form-control col-7"  type="password" required>
			</div>
			
			<div class="form-group row ">
				<label for="inputPasswordTwo" class="col-3"> Repita Contraseña</label>
				<input id="inputPasswordTwo" name="passwordTwo" class="form-control col-7"  type="password" required>
			</div>
			
			<div class="col-auto">
      			<button type="submit" class="btn btn-primary mb-2">Registrarme</button>
    		</div>
			
		</form>
		
	</div>

</body>
</html>