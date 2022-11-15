<%@page import="java.util.LinkedList"%>
<%@page import="entities.Usuario"%>
<%@page import="entities.Grupo_Musculo"%>
<%@page import="entities.Ejercicio"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">

 <%
 	Usuario userLogin =(Usuario)session.getAttribute("usuarioLogin");
	Ejercicio ej =(Ejercicio)request.getAttribute("ejercicio");
 %> 
 
<title>Consulta Ejercicio</title>

<link href="style/bootstrap.css" rel="stylesheet">
<style><%@include file="/WEB-INF/estilos/estilo.css"%></style>

</head>
<body>

	<div class="container">
	<%@ include file="/WEB-INF/MenuContextualAdmin.jsp"%>
	<div class="dentro d-flex flex-column  justify-content-center align-items-center">
	
		<div class="row text-center">
			<div class="col">
				<label class="font-weight-bold ">ID</label>
				<input class="form-control text-center bg-light" type="text" value="<%=ej.getId_ejercicio() %>" disabled>
			</div>	
		</div>
		
		<div class="row text-center">
			<div class="col text-center">
				<label class="font-weight-bold ">Nombre</label>
				<input class="form-control text-center bg-light" type="text" value="<%=ej.getNombre() %>" disabled>
			</div>
			<div class="col text-center">
				<label class="font-weight-bold ">Comentario</label>
				<textarea class="form-control text-center bg-light" rows="5" disabled><%=ej.getComentario()!=null?ej.getComentario():"" %></textarea>
			</div>	
		</div>
		
		<div class="row text-center">
			<div class="col">
				<label class="font-weight-bold ">Imagen de muestra</label>
				<input class="form-control text-center bg-light" type="image" src="<%=ej.getImagen() %>" disabled>
			</div>	
		</div>
		
		<div class="row">
			<div class="col-12 col-sm-12 col-lg-12">
	 					<caption>Grupos Músculos involucrados:</caption>
	 					<% if(ej.getGrupos_musculares().size()>0){ %>
	 					<table class="table table-responsive">
	 						<thead>
	 							<tr>
	 								<th>ID Grupo Muscular</th>
	 								<th>Nombre</th>
	 								<th>Comentario</th>
	 							</tr>
	 						</thead>
	 						<tbody>
	 						<%
									for (Grupo_Musculo gm : ej.getGrupos_musculares()) {
									%>
									<tr>
										<td><%=gm.getId_grupo()%></td>
										<td><%=gm.getNombre()%></td>
										<td><%=gm.getComentario()!=null?gm.getComentario():""%></td>
									</tr>
									<%				
									}
									%>
								</tbody>

							</table>
					<% }
	 				else{
	 					out.print("No hay grupos musculares asociados");
	 				}%>
					</div>	
			</div>
			<div class="botonn mb-3">
				<form action="ABMCEjercicio" method="post">
						<input type="hidden" class="custom-control-input" name="idUserLogin" value="<%=userLogin.getId_usuario()%>">
						<input type="hidden" class="custom-control-input" name="idEjercicio" value="<%=ej.getId_ejercicio()%>">
						<input type="hidden" class="custom-control-input" name="bandera" value="aModificar">
						<button type="submit" class="btn btn-warning" name="optionBM" value="modificacion">Modificar</button>
				</form>
			</div>
											
			<div class="botonn mb-3">
				<form action="ABMCEjercicio" method="post">
						<input type="hidden" class="custom-control-input" name="idUserLogin" value="<%=userLogin.getId_usuario()%>">
						<input type="hidden" class="custom-control-input" name="idEjercicio" value="<%=ej.getId_ejercicio()%>">
						<button type="submit" class="btn btn-danger" name="optionBM" value="baja">Eliminar</button>
				</form>
			</div>	
			<div class="botonn mb-3">
				<form action="ABMCEjercicio" method="get">	
      				<button type="submit" class="btn btn-secondary">Volver</button>
      			</form>
    		</div>
			
		</div>
		
	</div>
	<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
</body>
</html>