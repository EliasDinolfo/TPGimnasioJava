<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="entities.Usuario"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<%
 	Usuario u =(Usuario)session.getAttribute("usuario");
 %> 
</head>
<body>
	<h1>Llegaste el jsp del registro</h1>
	<h2>Hola <%=u.getNombre()%>
		<%=u.getApellido()%></h2>
	
	<h3>O mejor conocido por su nickname: <%=u.getUsername()%>
	
	<%=u.getId_usuario()%></h3>
	

</body>
</html>