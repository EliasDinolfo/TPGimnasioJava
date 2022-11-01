<%@page import="entities.Usuario"%>
<%@page import="entities.Rutina"%>
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
	Rutina r =(Rutina)request.getAttribute("rutina");
 	//LinkedList<Usuario> userlist=(LinkedList<Usuario>)request.getAttribute("listaUsuarios");
 %>
</head>
<body>
	<h1>Modificación de rutina</h1>
	
	<h2>Rutina a modificar: <%=r.getNombre()%></h2>
	
	
	<form action="ABMCRutina" method="post">
		 <input type="hidden" class="custom-control-input" name="id" value="<%=r.getId_rutina()%>">
		<div class="form-group  ">
				<label for="inputNombre" class=""> Nombre</label>
				<input id="inputNombre" name="nombre" class="form-control "  type="text" required>
			</div>
			
			<div class="form-group ">
				<label for="inputSemanas" class=""> Semanas</label>
				<input id="inputSemanas" name="semanas" class="form-control"  type="number">
			</div>
			
			<div class="form-group">
				<label for="selectNivel" name="lblNivel"> Nivel</label>
				<select class="form-select" name="selectNivel">
					<option selected> Seleccione uno</option>
					<option value="facil">Facil</option>
					<option value="medio">Medio</option>
					<option value="dificil">Dificil</option>
				</select>
			</div>
			
			<div class="form-group ">
				<label for="inputComentario" class=""> Comentario</label>
				<input id="inputComentario" name="comentario" class="form-control"  type="text">
			</div>		
	
		<div class="form-group">
	 		<input type="hidden" class="custom-control-input"  name="idUserLogin" value="<%=userLogin.getId_usuario()%>">
	 		<input type="hidden" class="custom-control-input"  name="dniInstructor" value="<%=r.getId_rutina()%>">
	 		<input type="hidden" class="custom-control-input"  name="bandera" value="Modificado">
	 		<button type="submit" class="btn btn-warning" name="optionBM" value="modificacion">Modificar</button>
	 	</div>
	 	
	 </form>
	 
	
</body>
</html>