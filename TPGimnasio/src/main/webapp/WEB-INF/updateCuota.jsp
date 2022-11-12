<%@page import="entities.Usuario"%>
<%@page import="entities.Cuota"%>
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
	Cuota c =(Cuota)request.getAttribute("cuota");
 	//LinkedList<Usuario> userlist=(LinkedList<Usuario>)request.getAttribute("listaUsuarios");
 %>
</head>
<body>
	<%@ include file="/WEB-INF/MenuContextualAdmin.jsp"%>
	<div class="container">
	<h1>Pago de cuota</h1>
	<form action="ABMCCuota" method="post">
	
		 <input type="hidden" class="custom-control-input" name="idUsuario" value="<%=c.getUsuario().getId_usuario()%>">
		 <input type="hidden" class="custom-control-input" name="fechaVencimiento" value="<%=c.getFecha_vencimiento()%>">
		<div class="form-group  ">
				<label for="inputFechaVencimiento" class=""> Fecha Vencimiento</label>
				<input id="inputFechaVencimiento" name="fechaVencimiento" class="form-control "  type="date" readonly="readonly" value="<%=c.getFecha_vencimiento()%>">
			</div>
		
			<div class="form-group ">
				<label for="inputMonto" class=""> Monto</label>
				<input id="inputMonto" name="monto" class="form-control"  type="text" readonly="readonly" value="$<%=c.getMonto()%>">
			</div>
			
		<p>Seleccione el método de pago:</p>
        <div class="form-check form-check-inline">
            <input class="form-check-input" type="radio" value="mercadopago" id="radio1"
            name="grupo1" checked>
            <label class="form-check-label" for="radio1">
            MercadoPago
            </label>
            </div>
            <div class="form-check form-check-inline">
            <input class="form-check-input" type="radio" value="tarjeta" id="radio2" name="grupo1">
            <label class="form-check-label" for="radio2">
            Tarjeta Débito/Crédito
            </label>
        </div>
        <div id="mercadopago" hidden="true" class="mt-4">
            <div class="form-group">
            <label for="nombre">Nombre:</label>
            <input type="text" class="form-control" id="nombre" name="nombre">
            </div>
            <div class="form-group">
            <label for="apellido">Apellido:</label>
            <input type="text" class="form-control" id="apellido" name="apellido">
            </div>
            <div class="form-group">
                <label for="cvu">Número de CVU:</label>
                <input type="number" class="form-control" id="cvu" name="cvu">
                </div>
        </div>
        <div id="tarjeta" hidden="true" class="mt-4">
            <div class="form-group">
            <label for="nrotarjeta">Número de tarjeta:</label>
            <input type="number" class="form-control" id="nrotarjeta" name="nrotarjeta">
            </div>
            <div class="form-group">
                <label for="fechavencimiento">Fecha de vencimiento:</label>
                <input type="month" class="form-control" id="fechavencimiento" name="fechavencimiento">
            </div>
            <div class="form-group">
                <label for="codigoseguridad">Código de Seguridad:</label>
                <input type="number" class="form-control" id="codigoseguridad" name="codigoseguridad">
            </div>
            <div class="form-group">
            <label for="dni">DNI:</label>
            <input type="number" class="form-control" id="dni" name="dni">
            </div>
            <div class="form-group">
                <label for="nombretitular">Nombre del Titular:</label>
                <input type="text" class="form-control" id="nombretitular" name="nombretitular">
            </div>
            <div class="form-group">
                <label for="apellidotitular">Apellido del Titular:</label>
                <input type="text" class="form-control" id="apellidotitular" name="apellidotitular">
            </div>
            <div class="form-group">
                <label for="fechanac">Fecha de Nacimiento:</label>
                <input type="date" class="form-control" id="fechanac" name="fechanac">
            </div>
            <div class="form-group">
                <label for="email">Email:</label>
                <input type="email" class="form-control" id="email" name="email">
            </div>
            <div class="form-group">
                <label for="telefono">Teléfono:</label>
                <input type="tel" class="form-control" id="telefono" name="telefono">
            </div>
    </div>
		<div class="form-group">
	 		<input type="hidden" class="custom-control-input"  name="idUserLogin" value="<%=userLogin.getId_usuario()%>">
	 		<input type="hidden" class="custom-control-input"  name="bandera" value="Modificado">
	 		<button type="submit" class="btn btn-warning" name="optionBM" value="modificacion">Pagar</button>
	 	</div>
	</form>	
	 </div>
	   <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>  
<script>
    addEventListener('DOMContentLoaded',inicio,false);
    function inicio()
    {   
    document.getElementById('radio1').addEventListener('change',mercadopago,false);    
    document.getElementById('radio2').addEventListener('change',tarjeta,false);
    mercadopago();
    }
    function cambiocheckbox()
    {
    alert(document.getElementById('checkbox1').checked);
    }
    function mercadopago()
    {
    document.getElementById('mercadopago').hidden=false;
    document.getElementById('tarjeta').hidden=true;
    }
    function tarjeta()
    {
    document.getElementById('tarjeta').hidden=false;
    document.getElementById('mercadopago').hidden=true;
    }
  
</script>

</body>
</html>