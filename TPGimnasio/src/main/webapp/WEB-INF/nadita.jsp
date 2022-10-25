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
 	Usuario u =(Usuario)session.getAttribute("usuario");
 	LinkedList<Usuario> userlist=(LinkedList<Usuario>)request.getAttribute("users");
 %>  
</head>
<body>
<h4>Usuario: <%=u.getUsername()%></h4>
	<h1>HOLAA ESTO ES NADITA.JSP</h1>
</body>
</html>