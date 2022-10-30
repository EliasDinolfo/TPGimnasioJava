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
	Usuario u =(Usuario)request.getAttribute("usuario");
 	
 %>
 
 <link rel="stylesheet" href="style/styles.css">
<link href="style/bootstrap.css" rel="stylesheet">
 
</head>
<body>

	<h1>EL QUE INICIO SESION: <%=userLogin.getUsername() %> </h1>
	<h2>pagina que vamos a mostrar todos los datos de un user</h2>
	<ul>
		<li>ID USUARIO: <%=u.getId_usuario() %></li>
		<li>USERNAME: <%=u.getUsername() %></li>
		<li>NOMBRE: <%=u.getNombre() %></li>
		<li>Apellido <%=u.getApellido()%></li>
	</ul>
</body>
</html>