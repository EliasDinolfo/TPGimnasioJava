<%@page import="entities.Usuario"%>
<%@page import="entities.Grupo_Musculo"%>
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
	Grupo_Musculo gm =(Grupo_Musculo)request.getAttribute("grupo_musculo");
 	//LinkedList<Usuario> userlist=(LinkedList<Usuario>)request.getAttribute("listaUsuarios");
 %>
</head>
<body>
<div class="container">
	<%@ include file="/WEB-INF/MenuContextualAdmin.jsp"%>
	<h1>Modificación del Grupo Muscular:</h1>
	
	<h2><%=gm.getNombre()%> ID: <%=gm.getId_grupo() %></h2>
	
	
	<form action="ABMCGrupo_Musculo" method="post">
		 <input type="hidden" class="custom-control-input" name="idGrupo_Musculo" value="<%=gm.getId_grupo()%>">
		<div class="form-group  ">
				<label for="inputNombre" class=""> Nombre</label>
				<input id="inputNombre" name="nombre" class="form-control "  type="text" placeholder="<%=gm.getNombre()%>" value="<%=gm.getNombre()%>" required>
			</div>
			
			<div class="form-group  ">
				<label for="inputComentario" class=""> Comentario</label>
				<textarea id="inputComentario" name="comentario" class="form-control " rows="5" placeholder="<%=gm.getComentario()!=null?gm.getComentario():""%>" required><%=gm.getComentario()!=null?gm.getComentario():""%></textarea>
				
			</div>
	
		<div class="form-group">
	 		<input type="hidden" class="custom-control-input"  name="idUserLogin" value="<%=userLogin.getId_usuario()%>">
	 		<input type="hidden" class="custom-control-input"  name="idGrupo_Musculo" value="<%=gm.getId_grupo()%>">
	 		<input type="hidden" class="custom-control-input"  name="bandera" value="Modificado">
	 		<button type="submit" class="btn btn-warning" name="optionBM" value="modificacion">Modificar</button>
	 	</div>
	 </form>
	 <form action="ABMCGrupo_Musculo" method="get">
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