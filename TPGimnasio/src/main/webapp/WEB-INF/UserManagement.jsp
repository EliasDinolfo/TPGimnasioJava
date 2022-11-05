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
	<%@ include file="/WEB-INF/MenuContextualAdmin.jsp"%>
		<h1 class="text-center">Administrador <%=userLogin.getUsername() %></h1>
    <div class="grande container-fluid d-flex justify-content-center flex-wrap align-content-center">
		
		<form action="Conexion" method="post">
		
			<div class="card box1 ">
			<input type="hidden" class="custom-control-input"  name="idUserLogin" value="<%=userLogin.getId_usuario()%>">
			<button class="cuadros btn  text-center p-0" type="submit" name="optionBM" value="firstlog">
        		<img class="card-img-top border-0" src="https://tinypic.host/images/2022/10/29/Opera-Captura-de-pantalla_2022-10-28_223011_getbootstrap.com.png" alt="Opera-Captura-de-pantalla_2022-10-28_223011_getbootstrap.com.png" alt="Card image cap">
       			<div class="card-body">
       				
       				<!-- <input type="hidden" class="custom-control-input"  name="listaUsuarios" value=""> -->
          			<h5>Usuarios</h5>
        		</div>	
        	</button>	
    		</div>
			
		</form>
      

	<form action="Conexion" method="post">
		
			<div class="card box1 ">
				<input type="hidden" class="custom-control-input"  name="alta" value="noborrarestopls">
				<input type="hidden" class="custom-control-input"  name="idUserLogin" value="<%=userLogin.getId_usuario()%>">
				<button class="btn cuadros text-center p-0" type="submit" name="optionBM" value="planes"> 
			
        		<img class="card-img-top border-0" src="https://tinypic.host/images/2022/10/29/Opera-Captura-de-pantalla_2022-10-28_223011_getbootstrap.com.png" alt="Opera-Captura-de-pantalla_2022-10-28_223011_getbootstrap.com.png" alt="Card image cap">
       			<div class="card-body">
       				
       				<!-- <input type="hidden" class="custom-control-input"  name="listaUsuarios" value=""> -->
          			<h5>Planes</h5>
        		</div>	
        		</button>	
    		</div>
			
	</form>
	
	<form action="Conexion" method="post">
		
			<div class="card box1 ">
				<input type="hidden" class="custom-control-input"  name="idUserLogin" value="<%=userLogin.getId_usuario()%>">
				<button class="btn cuadros  text-center p-0" type="submit" name="optionBM" value="instructores">
        		<img class="card-img-top border-0" src="https://tinypic.host/images/2022/10/29/Opera-Captura-de-pantalla_2022-10-28_223011_getbootstrap.com.png" alt="Opera-Captura-de-pantalla_2022-10-28_223011_getbootstrap.com.png" alt="Card image cap">
       			<div class="card-body">
       				
       				<!-- <input type="hidden" class="custom-control-input"  name="listaUsuarios" value=""> -->
          			<h5>Instructores</h5>
        		</div>	
        		</button>	
    		</div>
			
	</form>
		
     <form action="Conexion" method="post">
		
			<div class="card box1 ">
				<input type="hidden" class="custom-control-input"  name="idUserLogin" value="<%=userLogin.getId_usuario()%>">
				<button class="btn cuadros text-center p-0" type="submit" name="optionBM" value="rutinas">
        		<img class="card-img-top border-0" src="https://tinypic.host/images/2022/10/29/Opera-Captura-de-pantalla_2022-10-28_223011_getbootstrap.com.png" alt="Opera-Captura-de-pantalla_2022-10-28_223011_getbootstrap.com.png" alt="Card image cap">
       			<div class="card-body">
       				
       				<!-- <input type="hidden" class="custom-control-input"  name="listaUsuarios" value=""> -->
          			<h5>Rutinas</h5>
        		</div>	
        		</button>	
    		</div>
			
	</form> 

     <form action="#" method="post">
		
			<div class="card box1 ">
				<input type="hidden" class="custom-control-input"  name="idUserLogin" value="<%=userLogin.getId_usuario()%>">
				<button class="btn cuadros  text-center p-0" type="submit" name="optionBM" value="firstLog">
        		<img class="card-img-top border-0" src="https://tinypic.host/images/2022/10/29/Opera-Captura-de-pantalla_2022-10-28_223011_getbootstrap.com.png" alt="Opera-Captura-de-pantalla_2022-10-28_223011_getbootstrap.com.png" alt="Card image cap">
       			<div class="card-body">
       				
       				<!-- <input type="hidden" class="custom-control-input"  name="listaUsuarios" value=""> -->
          			<h5>Grupo Musculo</h5>
        		</div>	
        		</button>	
    		</div>
			
	</form> 
	
	<form action="Conexion" method="post">
		
			<div class="card box1 ">
				<input type="hidden" class="custom-control-input"  name="idUserLogin" value="<%=userLogin.getId_usuario()%>">
				<button class="btn cuadros  text-center p-0" type="submit" name="optionBM" value="ejercicios">
        		<img class="card-img-top border-0" src="https://tinypic.host/images/2022/10/29/Opera-Captura-de-pantalla_2022-10-28_223011_getbootstrap.com.png" alt="Opera-Captura-de-pantalla_2022-10-28_223011_getbootstrap.com.png" alt="Card image cap">
       			<div class="card-body">
       				
       				<!-- <input type="hidden" class="custom-control-input"  name="listaUsuarios" value=""> -->
          			<h5>Ejercicios</h5>
        		</div>	
        		</button>	
    		</div>
			
	</form> 



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