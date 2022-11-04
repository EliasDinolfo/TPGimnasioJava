<%@page import="entities.Usuario"%>
<%@page import="entities.Ejercicio"%>
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
	Ejercicio e =(Ejercicio)request.getAttribute("ejercicio");
 %>
 

</head>
<body>
		<div class="container  ">
		<div <%= request.getAttribute("mensaje")==null ? "hidden": ""%> class="alert alert-danger alert-dismissible">
            <p><%= request.getAttribute("mensaje") %></p>
            <button type="button" class="close" data-dismiss="alert">
              <span>x</span>
            </button>
   		 </div>      
		<h1 class="text-center mt-2">Registro ejercicio</h1>
		
		<form action="ABMCEjercicio" method="post" class="form-registro ">
		<input type="hidden" class="custom-control-input" name="optionBM" value="alta">
		<input type="hidden" class="custom-control-input" name="bandera" value="añadido">
		<input type="hidden" class="custom-control-input" name="idUserLogin" value="<%=userLogin.getId_usuario()%>">
		
			<div class="form-group row ">
				<label for="inputNombre" class="col-2"> Nombre</label>
				<input id="inputNombre" name="nombre" class="form-control col-8"  type="text">
			</div>
			
			<div class="form-group row ">
				<label for="inputComentario" class="col-2"> Comentario</label>
				<input id="inputComentario" name="comentario" class="form-control col-8"  type="text">
			</div>
			
			<div class="form-group row ">
				<label for="inputImagen" class="col-2"> Imagen</label>
				<input id="inputImagen" name="imagen" class="form-control col-8"  type="text">
			</div>
			
			<div class="form-group row ">
				<label for="inputVideo" class="col-2"> Video</label>
				<input id="inputVideo" name="comentario" class="form-control col-8"  type="text">
			</div>			
			
			<div class="col-auto">
      			<button type="submit" class="btn btn-primary mb-2">Agregar</button>
    		</div>		
		</form>
		
	</div>
</body>
</html>