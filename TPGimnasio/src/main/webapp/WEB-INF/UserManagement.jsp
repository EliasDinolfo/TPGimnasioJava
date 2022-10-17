<%@page import="java.util.LinkedList"%>
<%@page import="entities.Usuario"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="">
<meta name="author" content="">
   
 <%
 	Usuario u =(Usuario)session.getAttribute("usuario");
 	LinkedList<Usuario> userlist=(LinkedList<Usuario>)request.getAttribute("listaUsuarios");
 %>  
   
<title>1st jps-servlet testing</title>

<!-- Bootstrap core CSS -->
<link href="style/bootstrap.css" rel="stylesheet">
<!-- Custom styles for this template -->
<link href="style/start.css" rel="stylesheet">

</head>
<body>
	<div class="container">
	 	<div class="row">
	 		<h4>Usuarios</h4>
	 			<div class="col-12 col-sm-12 col-lg-12">
	 				<div class="table-responsive">
	 					<table class="table">
	 						<thead>
	 							<tr>
	 								<th>ID</th>
	 								<th>Nombre</th>
	 								<th>Apellido</th>
	 								<th>Telefono</th>
	 								<th>Tipo Documento</th>
	 								<th>DNI</th>
	 								<th>Email</th>
	 								<th>Genero</th>
	 								<th>Username</th>
	 								<th>Direccion</th>
	 								<th>Fecha nacimiento</th>
	 								<th>Rol</th>
	 								<th></th>
	 								<th></th>
	 							</tr>
	 						</thead>
	 						<tbody>
	 						
	 						<% for(Usuario usu : userlist){%>
	 							<tr>
	 								<td><%=usu.getId_usuario() %></td>
	 								<td><%=usu.getNombre() %></td>
	 								<td><%=usu.getApellido() %></td>
	 								<td><%=usu.getTelefono() %></td>
	 								<td><%=usu.getTipo_doc() %></td>
	 								<td><%=usu.getDni() %></td>
	 								<td><%=usu.getEmail() %></td>
	 								<td><%=usu.getGenero() %></td>
	 								<td><%=usu.getUsername() %></td>
	 								<td><%=usu.getDireccion() %></td>
	 								<td><%=usu.getFecha_nacimiento() %></td>
	 								<td><%=usu.getRol().getDescripcion() %></td>
	 								<td></td><!-- editar -->
	 								<td></td><!-- borrar -->
	 								
	 							</tr>
	 						<%} %>
	 						</tbody>
	 						
	 					</table>
	 				</div>
	 			</div>
	 	</div>
	</div>
</body>
</html>