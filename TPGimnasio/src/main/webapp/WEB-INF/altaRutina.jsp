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
		<div <%= request.getAttribute("mensaje")==null ? "hidden": ""%> class="alert alert-danger alert-dismissible">
            <p><%= request.getAttribute("mensaje") %></p>
            <button type="button" class="close" data-dismiss="alert">
              <span>x</span>
            </button>
   		 </div>      
		<h1 class="text-center mt-2">Registro rutina</h1>
		
		<form action="ABMCRutina" method="post" class="form-registro ">
		<input type="hidden" class="custom-control-input" name="optionBM" value="alta">
		<input type="hidden" class="custom-control-input" name="bandera" value="a�adido">
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
					<option value="dni">Facil</option>
					<option value="pasaporte">Medio</option>
					<option value="libretaCivica">Dificil</option>
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
</body>
</html>