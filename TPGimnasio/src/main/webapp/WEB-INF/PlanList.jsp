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
	<h2>Lista de planes</h2>
	
	<div class="container">
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
	 						
	 						<%
									for (Plan pl : planlist ) {
										
									%><!-- para que no muestre al administrador -->
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
													<input type="hidden" class="custom-control-input" name="idUser" value="<%=pl.getId_plan()%>">
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
													<input type="hidden" class="custom-control-input" name="idUser" value="<%=pl.getId_plan()%>">
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
</body>
</html>