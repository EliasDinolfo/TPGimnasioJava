<%@page import="entities.Usuario"%>
<%@page import="entities.Rutina"%>
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
	Rutina r =(Rutina)request.getAttribute("rutina");
 %>
 
</head>
<body>
		<div class="container  ">
		<%@ include file="/WEB-INF/MenuContextualAdmin.jsp"%>
		<div <%= request.getAttribute("mensaje")==null ? "hidden": ""%> class="alert alert-danger alert-dismissible">
            <p><%= request.getAttribute("mensaje") %></p>
            <button type="button" class="close" data-dismiss="alert">
              <span>x</span>
            </button>
   		 </div>      
		<h1 class="text-center mt-2">Registro rutina</h1>
		
		<form action="ABMCRutina" method="post" class="form-registro ">
		<input type="hidden" class="custom-control-input" name="optionBM" value="alta">
		<input type="hidden" class="custom-control-input" name="bandera" value="añadido">
		<input type="hidden" class="custom-control-input" name="idUserLogin" value="<%=userLogin.getId_usuario()%>">
		
			<div class="form-group row ">
				<label for="inputNombre" class="col-2"> Nombre</label>
				<input id="inputNombre" name="nombre" class="form-control col-8"  type="text">
			</div>
			
			<div class="form-group row ">
				<label for="inputSemanas" class="col-2"> Semanas</label>
				<input id="inputSemanas" name="semanas" class="form-control col-8"  type="number">
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
			
			<div class="form-group row ">
				<label for="inputComentario" class="col-2"> Comentario</label>
				<input id="inputComentario" name="comentario" class="form-control col-8"  type="text">
			</div>
						
			
			<div class="col-auto">
      			<button type="submit" class="btn btn-primary mb-2">Agregar</button>
    		</div>		
		</form>
		
	</div>
	  <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>  
</body>
</html>