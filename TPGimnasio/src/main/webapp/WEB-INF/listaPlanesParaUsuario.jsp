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
	<div <%= request.getAttribute("mensaje")==null ? "hidden": ""%> class="alert alert-<%=request.getAttribute("color")==null? "danger" :"primary" %> alert-dismissible">
            <p><%= request.getAttribute("mensaje") %></p>
            <button type="button" class="close" data-dismiss="alert">
              <span>x</span>
            </button>
    </div>
    <h2>Lista de planes disponibles para: <%=userLogin.getUsername() %></h2>
    <div class="col-12 col-sm-12 col-lg-12">
	 				<div class="table-responsive">
	 					<table class="table">
	 						<thead>
	 							<tr>
	 								<th>Nombre</th>
	 								<th>Descripcion</th>
	 								<th></th>
	 							</tr>
	 						</thead>
	 						<tbody>
	 						
	 						<%for (Plan pl : planlist ) {%>
									<tr>
										<td><%=pl.getNombre()%></td>
										<td><%=pl.getDescripcion()%></td>
										
										<td>
											<!-- inscripcion -->
											<div>
												<form action="InscripcionPlan" method="post">
													<input type="hidden" class="custom-control-input" name="idUserLogin" value="<%=userLogin.getId_usuario()%>">
													<input type="hidden" class="custom-control-input" name="idPlan" value="<%=pl.getId_plan()%>">
													<button type="submit" class="btn btn-success" name="boton">Inscribirse</button>
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
</body>
</html>