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
 	Usuario userLogin =(Usuario)session.getAttribute("usuarioLogin");
 	LinkedList<Usuario> userlist=(LinkedList<Usuario>)request.getAttribute("listaUsuarios");
 %>
 
 <!-- Bootstrap core CSS -->
<link href="style/bootstrap.css" rel="stylesheet">
<!-- Custom styles for this template -->
<link href="style/styles.css" rel="stylesheet">  
</head>
<body>
<h4>Usuario: <%=userLogin.getUsername()%></h4>
	<div class="container movete">
    <ul class="nav nav-tabs mt-3">
      <li class="nav-item">
        <a class="nav-link active"  data-toggle="tab" href="#opcion1" >Usuarios</a>
      </li>
      <li class="nav-item">
        <a class="nav-link"  data-toggle="tab" href="#opcion2">Planes</a>
      </li>
      <li class="nav-item">
        <a class="nav-link"  data-toggle="tab" href="#opcion3">Grupos Musculares</a>
      </li>
    </ul>
    <div class="tab-content">
      <div class="tab-pane fade show active" id="opcion1">
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
	 								
	 								<th></th>
	 								<th></th>
	 							</tr>
	 						</thead>
	 						<tbody>
	 						
	 						<% for(Usuario usu : userlist){
	 								if(usu.getRol().getId_rol()==3){%><!-- para que no muestre al administrador -->
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
	 	
	 								<td><!-- editar -->
	 									<div>
	 										<form action="ABMCUsuario" method="post">
	 											<input type="hidden" class="custom-control-input"  name="idUserLogin" value="<%=userLogin.getId_usuario()%>">
	 											<input type="hidden" class="custom-control-input"  name="idUser" value="<%=usu.getId_usuario()%>">
	 											<input type="hidden" class="custom-control-input"  name="bandera" value="aModificar">
	 											<button type="submit" class="btn btn-warning" name="optionBM" value="modificacion">Modificar</button>
	 										</form>
	 									</div>
	 								</td>
	 								<td><!-- borrar -->
	 									<div>
	 										<form action="ABMCUsuario" method="post">
	 											<input type="hidden" class="custom-control-input"  name="idUserLogin" value="<%=userLogin.getId_usuario()%>">
	 											<input type="hidden" class="custom-control-input"  name="idUser" value="<%=usu.getId_usuario()%>">
	 											<button type="submit" class="btn btn-danger" name="optionBM" value="baja">Eliminar</button>
	 										</form>
	 									</div>
	 								</td>
	 								
	 								
	 							</tr>
	 						<%}} %>
	 						</tbody>
	 						
	 					</table>
	 				</div>
	 			</div>
	 	</div>
      </div>
      <div class="tab-pane fade" id="opcion2" >
      Cras non purus urna. Vestibulum nec felis felis. Quisque luctus vehicula ipsum,
      id pellentesque nulla luctus at. Maecenas ut sodales velit. Sed orci leo,
      </div>
      <div class="tab-pane fade" id="opcion3">
      Etiam congue, metus eu ultricies euismod, est magna condimentum sem, eget commodo
      elit nisl id sapien. Proin sodales accumsan nulla non molestie. Nulla tempus
      congue arcu, a sagittis ante dapibus vitae. Proin tincidunt tincidunt accumsan.
      dignissim id dapibus eget, posuere eu nibh.
      </div>
    </div>
  </div>
</body>
</html>