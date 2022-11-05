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

				<!--  request.setAttribute("mensaje", "Alta de plan exitoso");
				request.setAttribute("color", "primary");-->
	<form action="Conexion" method="post">
				<input type="hidden" class="custom-control-input"  name="idUserLogin" value="<%=userLogin.getId_usuario()%>">
				<input type="hidden" class="custom-control-input"  name="alta" value="modificacion">
				<button class="btn btn-primary " type="submit" name="optionBM" value="planes"> volver</button>
					
	</form>



</body>
</html>