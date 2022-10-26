<?xml version="1.0" encoding="ISO-8859-1" ?>
<%@page import="entities.Usuario"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1" />
<title>Eliminacion</title>
<link  href="style/bootstrap.css" rel="stylesheet "/>
<%
 	Usuario userLogin =(Usuario)session.getAttribute("usuarioLogin");
	Usuario u =(Usuario)request.getAttribute("usuario");
 	//LinkedList<Usuario> userlist=(LinkedList<Usuario>)request.getAttribute("listaUsuarios");
 %> 
</head>
<body>
	<h2>el del login es: <%=userLogin.getUsername() %></h2>
	<br />
	<h1>abmc existoso <%=u.getUsername()%> <%=u.getId_usuario() %></h1>
	
	
	
	<form action="signin" method="post">
		<input type="hidden" class="custom-control-input"  name="username" value="<%=userLogin.getUsername()%>" />
		<input type="hidden" class="custom-control-input"  name="password" value="<%=userLogin.getContrasenia()%>" />
		<button type="submit" class="btn btn-primary btn-lg">ir a perfil</button>
	</form>
	 
</body>
</html>