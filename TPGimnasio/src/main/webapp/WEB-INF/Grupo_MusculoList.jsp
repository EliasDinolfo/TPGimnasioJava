<%@page import="java.util.LinkedList"%>
<%@page import="entities.Usuario"%>
<%@page import="entities.Grupo_Musculo"%>
<%@page import="logic.Grupo_MusculoLogic"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<%
Usuario userLogin = (Usuario) session.getAttribute("usuarioLogin");
Grupo_MusculoLogic gmLogic = new Grupo_MusculoLogic();
LinkedList<Grupo_Musculo> grupo_musculolist = gmLogic.getAll();
%>

<!-- Bootstrap core CSS -->
<link href="style/bootstrap.css" rel="stylesheet">
<!-- Custom styles for this template -->
<link href="style/styles.css" rel="stylesheet">
</head>
<body>
	<%@ include file="/WEB-INF/MenuContextualAdmin.jsp"%>
	 <div <%=request.getAttribute("mensaje")==null ? "hidden": ""%> class="alert-dismissible <%=request.getAttribute("color")%>">
            <p><%= request.getAttribute("mensaje") %></p>
            <button type="button" class="close" data-dismiss="alert">
            <span>x</span>
            </button>
    </div>   
	<h4>Usuario: <%=userLogin.getUsername()%></h4>
	<div class="container">
     	<div class="row">
	 		<h4 class="mx-3 mb-3">Grupos Musculares</h4>
	 		<div>
				  <form action="ABMCGrupo_Musculo" method="post">
				   <input type="hidden" class="custom-control-input" name="idUserLogin" value="<%=userLogin.getId_usuario()%>">
					<!-- 	<input type="hidden" class="custom-control-input" name="idUser" value=""> -->
						<input type="hidden" class="custom-control-input" name="bandera" value="aA�adir">
						<button type="submit" class="btn btn-success" name="optionBM" value="alta">Agregar</button>
					 </form>
				 </div>
	 			<div class="col-12 col-sm-12 col-lg-12">
	 			
	 					<table class="table table-responsive">
	 						<thead>
	 							<tr>
	 								<th></th>
	 								<th>ID</th>
	 								<th>Nombre</th>
	 								<th>Comentario</th>
	 								<th></th>
	 								<th></th>
	 							</tr>
	 						</thead>
	 						<tbody>
	 						
	 						<%
									for (Grupo_Musculo gm : grupo_musculolist) {
									%>
									<tr class="<%= String.valueOf(gm.getId_grupo()).equals(String.valueOf(request.getAttribute("idFila")))?"table-secondary":""%>">
									<td>
											<!-- consulta -->
											<div>
												<form action="ABMCGrupo_Musculo" method="post">
													<input type="hidden" class="custom-control-input" name="idUserLogin" value="<%=userLogin.getId_usuario()%>">
													<input type="hidden" class="custom-control-input" name="idGrupo_Musculo" value="<%=gm.getId_grupo()%>">
													 <input type="hidden" class="custom-control-input" name="bandera" value="aModificar">
													<button type="submit" class="btn btn-consulta btn-primary text-center " name="optionBM" value="consulta">!</button>
												</form>
											</div>
										</td>
										<td><%=gm.getId_grupo()%></td>
										<td><%=gm.getNombre()%></td>
										<td><%=gm.getComentario()!=null?gm.getComentario():""%></td>

										<td>
											<!-- editar -->
											<div>
												<form action="ABMCGrupo_Musculo" method="post">
													<input type="hidden" class="custom-control-input" name="idUserLogin" value="<%=userLogin.getId_usuario()%>">
													<input type="hidden" class="custom-control-input" name="idGrupo_Musculo" value="<%=gm.getId_grupo()%>">
													 <input type="hidden" class="custom-control-input" name="bandera" value="aModificar">
													<button type="submit" class="btn btn-warning" name="optionBM" value="modificacion">Modificar</button>
												</form>
											</div>
										</td>
										<td>
											<!-- borrar -->
											<div>
												<form action="ABMCGrupo_Musculo" method="post">
													<input type="hidden" class="custom-control-input" name="idUserLogin" value="<%=userLogin.getId_usuario()%>">
													<input type="hidden" class="custom-control-input" name="idGrupo_Musculo" value="<%=gm.getId_grupo()%>">
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