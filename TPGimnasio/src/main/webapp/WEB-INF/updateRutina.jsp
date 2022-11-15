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
	<%@ include file="/WEB-INF/MenuContextualAdmin.jsp"%>
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
					<option value="Facil">Facil</option>
					<option value="Medio">Medio</option>
					<option value="Dificil">Dificil</option>
				</select>
			</div>
			
			<div class="form-group ">
				<label for="inputComentario" class=""> Comentario</label>
				<input id="inputComentario" name="comentario" class="form-control"  type="text">
			</div>		
	
		<div class="form-group">
	 		<input type="hidden" class="custom-control-input"  name="idUserLogin" value="<%=userLogin.getId_usuario()%>">
	 		<input type="hidden" class="custom-control-input"  name="idRutina" value="<%=r.getId_rutina()%>">
	 		<input type="hidden" class="custom-control-input"  name="bandera" value="Modificado">
	 		<button type="submit" class="btn btn-warning" name="optionBM" value="modificacion">Modificar</button>
	 	</div>
	 	
	 </form>
	 
	 <div class="botonn mb-3">
				<form action="ABMCRutina" method="get">	
      				<button type="submit" class="btn btn-secondary">Volver</button>
      			</form>
    		</div>
	 
  <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>  
</body>
</html>