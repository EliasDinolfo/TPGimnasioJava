<%@page import="entities.Plan"%>
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
Plan p =(Plan)request.getAttribute("plan");
%>


<!-- Bootstrap core CSS -->
<link href="style/bootstrap.css" rel="stylesheet">
<!-- Custom styles for this template -->
<style><%@include file="/WEB-INF/estilos/estilo.css"%></style>
</head>
<body>
	<h1>Inscripción de <%=userLogin.getUsername() %> al plan <%=p.getNombre() %> exitosa!</h1>
	<form action="ConexionUsuario" method="post">
				<input type="hidden" class="custom-control-input"  name="idUserLogin" value="<%=userLogin.getId_usuario()%>">
				<button class="btn btn-primary " type="submit" name="optionBM" value="inscripcionPlan"> Volver</button>
					
	</form>
</body>
</html>