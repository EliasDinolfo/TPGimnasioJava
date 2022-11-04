<%@page import="entities.Usuario"%>
<%@page import="entities.Ejercicio"%>
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
	Ejercicio e =(Ejercicio)request.getAttribute("ejercicio");
 	//LinkedList<Usuario> userlist=(LinkedList<Usuario>)request.getAttribute("listaUsuarios");
 %>
</head>
<body>
	<h1>Modificación de ejercicio</h1>
	
	<h2>Ejercicio a modificar: <%=e.getNombre()%></h2>
	
	
	<form action="ABMCEjercicio" method="post">
		 <input type="hidden" class="custom-control-input" name="id" value="<%=e.getId_ejercicio()%>">
		<div class="form-group  ">
				<label for="inputNombre" class=""> Nombre</label>
				<input id="inputNombre" name="nombre" class="form-control "  type="text" required>
			</div>
			
			<div class="form-group ">
				<label for="inputComentario" class=""> Comentario</label>
				<input id="inputComentario" name="comentario" class="form-control"  type="text">
			</div>
			
			<div class="form-group ">
				<label for="inputImagen" class=""> Imagen</label>
				<input id="inputImagen" name="imagen" class="form-control"  type="text">
			</div>
			
			<div class="form-group ">
				<label for="inputVideo" class=""> Video</label>
				<input id="inputVideo" name="video" class="form-control"  type="text">
			</div>			
	
		<div class="form-group">
	 		<input type="hidden" class="custom-control-input"  name="idUserLogin" value="<%=userLogin.getId_usuario()%>">
	 		<input type="hidden" class="custom-control-input"  name="idEjercicio" value="<%=e.getId_ejercicio()%>">
	 		<input type="hidden" class="custom-control-input"  name="bandera" value="Modificado">
	 		<button type="submit" class="btn btn-warning" name="optionBM" value="modificacion">Modificar</button>
	 	</div>
	 	
	 </form>
</body>
</html>