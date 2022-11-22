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
        		<img class="card-img-top border-0" src="https://tinypic.host/images/2022/11/22/Opera-Captura-de-pantalla_2022-10-28_223011_getbootstrap.com.png" alt="imagen-card-usuarios" alt="Card image cap">
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
			
        		<img class="card-img-top border-0" src="https://tinypic.host/images/2022/11/22/Opera-Captura-de-pantalla_2022-10-28_223011_getbootstrap.com.png" alt="imagen-card-planes">
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
        		<img class="card-img-top border-0" src="https://tinypic.host/images/2022/11/22/Opera-Captura-de-pantalla_2022-10-28_223011_getbootstrap.com.png" alt="imagen-card-Instructores">
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
        		<img class="card-img-top border-0" src="https://tinypic.host/images/2022/11/22/Opera-Captura-de-pantalla_2022-10-28_223011_getbootstrap.com.png" alt="imagen-card-Rutinas">
       			<div class="card-body">
       				
       				<!-- <input type="hidden" class="custom-control-input"  name="listaUsuarios" value=""> -->
          			<h5>Rutinas</h5>
        		</div>	
        		</button>	
    		</div>
			
	</form> 

     <form action="Conexion" method="post">
		
			<div class="card box1 ">
				<input type="hidden" class="custom-control-input"  name="idUserLogin" value="<%=userLogin.getId_usuario()%>">
				<button class="btn cuadros  text-center p-0" type="submit" name="optionBM" value="grupo_musculo">
        		<img class="card-img-top border-0" src="https://tinypic.host/images/2022/11/22/Opera-Captura-de-pantalla_2022-10-28_223011_getbootstrap.com.png" alt="imagen-card-grupomusculo">
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
        		<img class="card-img-top border-0" src="https://tinypic.host/images/2022/11/22/Opera-Captura-de-pantalla_2022-10-28_223011_getbootstrap.com.png" alt="imagen-card-ejercicios">
       			<div class="card-body">
       				
       				<!-- <input type="hidden" class="custom-control-input"  name="listaUsuarios" value=""> -->
          			<h5>Ejercicios</h5>
        		</div>	
        		</button>	
    		</div>
			
	</form> 
	
	<form action="Conexion" method="post">
		
			<div class="card box1 ">
				<input type="hidden" class="custom-control-input"  name="idUserLogin" value="<%=userLogin.getId_usuario()%>">
				<button class="btn cuadros  text-center p-0" type="submit" name="optionBM" value="cuotas">
        		<img class="card-img-top border-0" src="https://tinypic.host/images/2022/11/22/Opera-Captura-de-pantalla_2022-10-28_223011_getbootstrap.com.png" alt="imagen-card-cuotas">
       			<div class="card-body">
       				
       				<!-- <input type="hidden" class="custom-control-input"  name="listaUsuarios" value=""> -->
          			<h5>Cuotas</h5>
        		</div>	
        		</button>	
    		</div>
			
	</form> 



   </div>
   <% }else if(userLogin.getRol().getId_rol() == 2){ %>
   		<%@ include file="/WEB-INF/MenuContextualEncargado.jsp"%>
  		<h1 class="text-center">Encargado: <%=userLogin.getUsername() %></h1>
  		<div class="grande container-fluid d-flex justify-content-center flex-wrap align-content-center">
  				<form action="ConexionEncargado" method="post">
				<div class="card box1 ">
					<input type="hidden" class="custom-control-input"  name="idUserLogin" value="<%=userLogin.getId_usuario()%>">
					<button class="btn cuadros  text-center p-0" type="submit" name="optionBM" value="cuota">
        			<img class="card-img-top border-0" src="https://es.calcuworld.com/wp-content/uploads/sites/2/2013/02/autonomos-cuota.png" alt="Imagen cuota">
       				<div class="card-body">
       					<h5>Cuota</h5>
        			</div>	
        			</button>	
    			</div>	
				</form> 
  		</div>
  <%}else if(userLogin.getRol().getId_rol() == 3){ %>
  		<%@ include file="/WEB-INF/MenuContextualUsuario.jsp"%>
  		<h1 class="text-center">Usuario: <%=userLogin.getUsername() %></h1>
  			<div class="grande container-fluid d-flex justify-content-center flex-wrap align-content-center">
  				<form action="ConexionUsuario" method="post">
		
				<div class="card box1 ">
					<input type="hidden" class="custom-control-input"  name="idUserLogin" value="<%=userLogin.getId_usuario()%>">
					<button class="btn cuadros  text-center p-0" type="submit" name="optionBM" value="inscripcionPlan">
        			<img class="card-img-top border-0" src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS23zB6-hZd7_8E3SJNnqedIPnKrJY1QON9AoTICa2d6l4_pO3W3cs5QFLFixyJCwKa_ME&usqp=CAU" alt="Imagen inscripcion">
       				<div class="card-body">
       					<h5>Inscribirse a un plan</h5>
        			</div>	
        			</button>	
    			</div>	
				</form> 
  			</div>
  			<div class="grande container-fluid d-flex justify-content-center flex-wrap align-content-center">
  				<form action="ConexionUsuario" method="post">
		
				<div class="card box1 ">
					<input type="hidden" class="custom-control-input"  name="idUserLogin" value="<%=userLogin.getId_usuario()%>">
					<button class="btn cuadros  text-center p-0" type="submit" name="optionBM" value="cuota">
        			<img class="card-img-top border-0" src="https://es.calcuworld.com/wp-content/uploads/sites/2/2013/02/autonomos-cuota.png" alt="Imagen cuota">
       				<div class="card-body">
       					<h5>Cuota</h5>
        			</div>	
        			</button>	
    			</div>	
				</form> 
  			</div>
  <%} %>
  
  <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>  

</body>
</html>