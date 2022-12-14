<%@page import="entities.Usuario"%>
<%@page import="entities.Instructor"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<link href="style/bootstrap.css" rel="stylesheet">
<%
 	Usuario userLogin =(Usuario)session.getAttribute("usuarioLogin");
	Instructor i =(Instructor)request.getAttribute("instructor");
 	//LinkedList<Usuario> userlist=(LinkedList<Usuario>)request.getAttribute("listaUsuarios");
 %>
</head>
<body>
<div class="container">
	<%@ include file="/WEB-INF/MenuContextualAdmin.jsp"%>
	<h1>Modificación del Instructor:</h1>
	
	<h2><%=i.getNombre()+' '+i.getApellido() %>  DNI: <%=i.getDni() %></h2>
	
	
	<form action="ABMCInstructor" method="post">
		 <input type="hidden" class="custom-control-input" name="dni" value="<%=i.getDni()%>">
		<div class="form-group  ">
				<label for="inputNombre" class=""> Nombre</label>
				<input id="inputNombre" name="name" class="form-control "  type="text" placeholder="<%=i.getNombre()%>" value="<%=i.getNombre()%>" required>
			</div>
			
			<div class="form-group  ">
				<label for="inputApellido" class=""> Apellido</label>
				<input id="inputApellido" name="surname" class="form-control " placeholder="<%=i.getApellido()%>" value="<%=i.getApellido()%>" type="text">
			</div>
			
			<div class="form-group ">
				<label for="inputTelefono" class=""> Telefono</label>
				<input id="inputTelefono" name="telephone" class="form-control" placeholder="<%=i.getTelefono()%>" value="<%=i.getTelefono()%>" type="number">
			</div>
			
			<div class="form-group row ">
				<label for="inputEmail" class="col-2"> Email</label>
				<input id="inputEmail" name="email" class="form-control col-8" placeholder="<%=i.getEmail()%>" placeholder="<%=i.getTelefono()%>" value="<%=i.getEmail()%>" type="email">
			</div>
			
			
			<div class="form-group row ">
				<label for="inputFechaNacimiento" class="col-5">Fecha de nacimiento</label>
				<input id="inputFechaNacimiento" name="fechaNacimiento" class="form-control col-5" value="<%=i.getFecha_nacimiento()%>" type="date" required>
			</div>		
	
		<div class="form-group">
	 		<input type="hidden" class="custom-control-input"  name="idUserLogin" value="<%=userLogin.getId_usuario()%>">
	 		<input type="hidden" class="custom-control-input"  name="dniInstructor" value="<%=i.getDni()%>">
	 		<input type="hidden" class="custom-control-input"  name="bandera" value="Modificado">
	 		<button type="submit" class="btn btn-warning" name="optionBM" value="modificacion">Modificar</button>
	 	</div>
	 </form>
	 <form action="ABMCInstructor" method="get">
			<div class="form-group">
      			<button type="submit" class="btn btn-secondary">Volver</button>
    		</div>
	 </form>
</div>	 
  <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>  
</body>
</html>