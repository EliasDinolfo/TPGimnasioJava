<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Iniciar sesión</title>
<link rel="stylesheet" href="style/styles.css">
<link href="style/bootstrap.css" rel="stylesheet">

</head>
<body class="bo">

	 <div <%= request.getAttribute("mensaje")==null ? "hidden": ""%> class="alert alert-danger alert-dismissible">
            <p><%= request.getAttribute("mensaje") %></p>
            <button type="button" class="close" data-dismiss="alert">
              <span>x</span>
            </button>
    </div>      
	<div class="con pb-2 ">
	
		<h1 class="h1 pt-4 pb-2  text-center text-dark">Iniciar sesion</h1>
	
		<form class="form-signin mb-3" action="signin" method="post">
	
			<label for="InputUsername" class="text-left">Nombre de usuario:</label>
			<input id="InputUsername" class="form-control" name="username" type="text" placeholder="user123" required>
			<label for="InputPassword" class="mt-2 text-left">Contraseña:</label>
			<input id="InputPassword" class="form-control" name="password" type="password" placeholder="******" required>
			<button type="submit" class="mt-3 mb-1 btn-lg btn btn-primary ">Ingresar</button>
		
		</form>
		
		<a href="registro.html" class="link text-center"><p>Registrarme</p></a>
	</div>
	
	
    <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
</body>
</html>