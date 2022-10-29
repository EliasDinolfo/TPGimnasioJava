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
 	LinkedList<Usuario> userlist=(LinkedList<Usuario>)request.getAttribute("listaUsuarios");
 %>  
   
<title>1st jps-servlet testing</title>

<!-- Bootstrap core CSS -->
<link href="style/bootstrap.css" rel="stylesheet">
<!-- Custom styles for this template -->
<style><%@include file="/WEB-INF/estilos/estilo.css"%></style>

</head>
<body>
	<%if(userLogin.getRol().getId_rol() == 1){ %>
		<h1 class="text-center">Administrador <%=userLogin.getUsername() %></h1>
    <div class="grande container-fluid d-flex justify-content-center flex-wrap align-content-center">

		<form action="Conexion" method="post">
		
			<div class="card box1 ">
        		<img class="card-img-top border-0" src="https://tinypic.host/images/2022/10/29/Opera-Captura-de-pantalla_2022-10-28_223011_getbootstrap.com.png" alt="Opera-Captura-de-pantalla_2022-10-28_223011_getbootstrap.com.png" alt="Card image cap">
       			<div class="card-body">
       				<input type="hidden" class="custom-control-input"  name="idUserLogin" value="<%=userLogin.getId_usuario()%>">
       				<!-- <input type="hidden" class="custom-control-input"  name="listaUsuarios" value=""> -->
          			<button class="btn btn-link text-center" type="submit" name="optionBM" value="firstlog">Usuarios</button>
        		</div>		
    		</div>
			
		</form>
      


      <div class="card box1">
        <a href="#"  class="text-decoration-none text-dark">
        <img class="card-img-top" src="https://tinypic.host/images/2022/10/29/Opera-Captura-de-pantalla_2022-10-28_223011_getbootstrap.com.png" alt="Opera-Captura-de-pantalla_2022-10-28_223011_getbootstrap.com.png" alt="Card image cap">
        <div class="card-body">
          <h5 class="card-title text-center">Planes</h5>
        </div>
      </a>
      </div>

      <div class="card box1">
        <a href="#" class="text-decoration-none text-dark">
        <img class="card-img-top" src="https://tinypic.host/images/2022/10/29/Opera-Captura-de-pantalla_2022-10-28_223011_getbootstrap.com.png" alt="Opera-Captura-de-pantalla_2022-10-28_223011_getbootstrap.com.png" alt="Card image cap">
        <div class="card-body">
          <h5 class="card-title text-center">Instructores</h5>
        </div>
      </a>
      </div>

      <div class="card box1">
        <a href="#"  class="text-decoration-none text-dark">
        <img class="card-img-top" src="https://tinypic.host/images/2022/10/29/Opera-Captura-de-pantalla_2022-10-28_223011_getbootstrap.com.png" alt="Opera-Captura-de-pantalla_2022-10-28_223011_getbootstrap.com.png" alt="Card image cap">
        <div class="card-body">
          <h5 class="card-title text-center">Rutinas</h5>
        </div>
      </a>
      </div>

      <div class="card box1">
        <a href="#" class="text-decoration-none text-dark">
        <img class="card-img-top" src="https://tinypic.host/images/2022/10/29/Opera-Captura-de-pantalla_2022-10-28_223011_getbootstrap.com.png" alt="Opera-Captura-de-pantalla_2022-10-28_223011_getbootstrap.com.png" alt="Card image cap">
        <div class="card-body">
          <h5 class="card-title text-center ">Grupo Musculo</h5>
        </div>
      </a>
      </div>


   </div>
   <% }else if(userLogin.getRol().getId_rol() == 2){ %>
  		<h1>menu de encargado</h1>
  <%}else if(userLogin.getRol().getId_rol() == 3){ %>
  		<h1>menu usuario</h1>
  <%} %>
  
  <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>  

</body>
</html>