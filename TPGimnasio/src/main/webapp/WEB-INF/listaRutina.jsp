<%@page import="java.util.LinkedList"%>
<%@page import="entities.Usuario"%>
<%@page import="entities.Rutina"%>
<%@page import="logic.RutinaLogic"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<%
Usuario userLogin = (Usuario) session.getAttribute("usuarioLogin");
RutinaLogic rutLogic = new RutinaLogic();
LinkedList<Rutina> rutinalist = rutLogic.getAll();
%>

<!-- Bootstrap core CSS -->
<link href="style/bootstrap.css" rel="stylesheet">
<!-- Custom styles for this template -->
<link href="style/styles.css" rel="stylesheet">
</head>
<body>
	<%@ include file="/WEB-INF/MenuContextualAdmin.jsp"%>
	 <div <%= request.getAttribute("mensaje")==null ? "hidden": ""%> class="alert alert-danger alert-dismissible">
            <p><%= request.getAttribute("mensaje") %></p>
            <button type="button" class="close" data-dismiss="alert">
              <span>x</span>
            </button>
    </div>   

	<h4>Usuario: <%=userLogin.getUsername()%></h4>
	<div class="container">
     	<div class="row">
	 		<h4 class="mx-3 mb-3">Rutinas</h4>
	 		<div>
				  <form action="ABMCRutina" method="post">
				   <input type="hidden" class="custom-control-input" name="idUserLogin" value="<%=userLogin.getId_usuario()%>">
					<!-- 	<input type="hidden" class="custom-control-input" name="idUser" value=""> -->
						<input type="hidden" class="custom-control-input" name="bandera" value="aAnadir">
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
	 								<th>Semanas</th>
	 								<th>Nivel</th>
	 								<th>Comentario</th>
	 								<th></th>
	 								<th></th>
	 							</tr>
	 						</thead>
	 						<tbody>
	 						
	 						<%
									for (Rutina rut : rutinalist) {
									%>
									<tr>
										<td>
											<!-- consulta -->
											<div>
												<form action="ABMCRutina" method="post">
													<input type="hidden" class="custom-control-input" name="idUserLogin" value="<%=userLogin.getId_usuario()%>">
													<input type="hidden" class="custom-control-input" name="idRutina" value="<%=rut.getId_rutina()%>">
													<button type="submit" class="btn btn-consulta btn-primary text-center" name="optionBM" value="consulta">!</button>
												</form>
											</div>
										</td>
										<td><%=rut.getId_rutina()%></td>
										<td><%=rut.getNombre()%></td>
										<td><%=rut.getSemanas()%></td>
										<td><%=rut.getNivel()%></td>
										<td><%=rut.getComentario()!=null?rut.getComentario():""%></td>

										<td>
											<!-- editar -->
											<div>
												<form action="ABMCRutina" method="post">
													<input type="hidden" class="custom-control-input" name="idUserLogin" value="<%=userLogin.getId_usuario()%>">
													<input type="hidden" class="custom-control-input" name="idRutina" value="<%=rut.getId_rutina()%>">
													 <input type="hidden" class="custom-control-input" name="bandera" value="aModificar">
													<button type="submit" class="btn btn-warning" name="optionBM" value="modificacion">Modificar</button>
												</form>
											</div>
										</td>
										<td>
											<!-- borrar -->
											<div>
												<form action="ABMCRutina" method="post">
													<input type="hidden" class="custom-control-input" name="idUserLogin" value="<%=userLogin.getId_usuario()%>">
													<input type="hidden" class="custom-control-input" name="idRutina" value="<%=rut.getId_rutina()%>">
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
		</div>	
	
	
<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
</body>
</html>