<%@page import="entities.Plan"%>
<%@page import="java.util.LinkedList"%>
<%@page import="entities.Usuario"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>

<%
Usuario userLogin = (Usuario) session.getAttribute("usuarioLogin");
LinkedList<Plan> planlist = (LinkedList<Plan>) request.getAttribute("listaPlanes");
%>

<!-- Bootstrap core CSS -->
<link href="style/bootstrap.css" rel="stylesheet">
<!-- Custom styles for this template -->
<style><%@include file="/WEB-INF/estilos/estilo.css"%></style>

</head>
<body>
	<div <%= request.getAttribute("mensaje")==null ? "hidden": ""%> class="alert alert-danger alert-dismissible">
            <p><%= request.getAttribute("mensaje") %></p>
            <button type="button" class="close" data-dismiss="alert">
              <span>x</span>
            </button>
    </div> 
	<h2>Lista de planes</h2>
	
	<div class="container">
	 		<div class="">
	 			<form action="ABMCPlan" method="post" >											
	 				<button type="submit" class="btn btn-success" name="optionBM" value="alta">Agregar</button>
	 			</form>
	 		</div>
	<div class="col-12 col-sm-12 col-lg-12">
	 				<div class="table-responsive">
	 					<table class="table">
	 						<thead>
	 							<tr>
	 								<th></th>
	 								<th>ID</th>
	 								<th>Nombre</th>
	 								<th>Descripcion</th>
	 								<th>Fecha Expiracion</th>
	 								<th></th>
	 								<th></th>
	 							</tr>
	 						</thead>
	 						<tbody>
	 						
	 						<%for (Plan pl : planlist ) {%>
									<tr>
									
									<td>
											<!-- consulta -->
											<div>
												<form action="ABMCPlan" method="post">
													<input type="hidden" class="custom-control-input" name="idUserLogin" value="<%=userLogin.getId_usuario()%>">
													<input type="hidden" class="custom-control-input" name="idPlan" value="<%=pl.getId_plan()%>">
													 <input type="hidden" class="custom-control-input" name="bandera" value="aModificar">
													<button type="submit" class="btn btn-consulta btn-primary text-center " name="optionBM" value="consulta">!</button>
												</form>
											</div>
										</td>
										<td><%=pl.getId_plan()%></td>
										<td><%=pl.getNombre()%></td>
										<td><%=pl.getDescripcion()%></td>
										<td><%=pl.getFecha_expiracion()%></td>
										

										<td>
											<!-- editar -->
											<div>
												<form action="ABMCPlan" method="post">
													<input type="hidden" class="custom-control-input" name="idUserLogin" value="<%=userLogin.getId_usuario()%>">
													<input type="hidden" class="custom-control-input" name="idPlan" value="<%=pl.getId_plan()%>">
													 <input type="hidden" class="custom-control-input" name="bandera" value="aModificar">
													<button type="submit" class="btn btn-warning" name="optionBM" value="modificacion">Modificar</button>
												</form>
											</div>
										</td>
										<td>
											<!-- borrar -->
											<div>
												<form action="ABMCPlan" method="post">
													<input type="hidden" class="custom-control-input" name="idUserLogin" value="<%=userLogin.getId_usuario()%>">
													<input type="hidden" class="custom-control-input" name="idPlan" value="<%=pl.getId_plan()%>">
													<button type="submit" class="btn btn-danger" name="optionBM" value="baja">Eliminar</button>
												</form>
											</div>
										</td>


									</tr>
									<%
									}
									
									%>
								</tbody>

							</table>
						</div>
					</div>
					</div>
					
					
		<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
		<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
		<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
</body>
</html>