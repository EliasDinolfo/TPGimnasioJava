<%@page import="java.util.LinkedList"%>
<%@page import="entities.Usuario"%>
<%@page import="entities.Plan"%>
<%@page import="entities.Cuota"%>
<%@page import="logic.CuotaLogic"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<%
Usuario userLogin = (Usuario) session.getAttribute("usuarioLogin");
CuotaLogic cuotaLogic = new CuotaLogic();
LinkedList<Cuota> cuotalist = cuotaLogic.getAll();
%>

<!-- Bootstrap core CSS -->
<link href="style/bootstrap.css" rel="stylesheet">
<!-- Custom styles for this template -->
<link href="style/styles.css" rel="stylesheet">
</head>
<body>
	<% if(userLogin.getRol().getId_rol()==1){ %>
		<%@ include file="/WEB-INF/MenuContextualAdmin.jsp"%>
	<% }else{%>
		<%@ include file="/WEB-INF/MenuContextualEncargado.jsp"%>
	<%}%>
	 <div <%=request.getAttribute("mensaje")==null ? "hidden": ""%> class="alert-dismissible <%=request.getAttribute("color")%>">
            <p><%= request.getAttribute("mensaje") %></p>
            <button type="button" class="close" data-dismiss="alert">
            <span>x</span>
            </button>
    </div>   
	<h4><%=userLogin.getRol().getDescripcion().substring(0, 1).toUpperCase() + userLogin.getRol().getDescripcion().substring(1)%>: <%=userLogin.getUsername()%></h4>
	<div class="container">
     	<div class="row">
	 		<h4 class="mx-3 mb-3">Cuotas</h4><br>
	 	</div>
	 		<div class="row">
	 			<div class="col form-check-inline">
	 				<label for="filtroDni" class="mr-sm-2">Dni Usuario:</label>
      				<input type="text" class="form-control mr-sm-2" id="filtroDniTexto" >
      				<button type="submit" class="btn btn-success ml-sm-2" id="filtroDniBoton">Buscar</button>
	 			</div>
	 		</div>
      				
      			<div class="form-check row">
   					<div class="col">
   						<label class="form-check-label ml-10 inline">
          				<input type="checkbox" class="form-check-input mr-sm-2" id="filtroCuotaImpaga">Cuotas Impagas </label>
        				
   					</div>
      			</div>
      			
	 			<div class="col-12 col-sm-12 col-lg-12">
	 			
	 					<table class="table table-responsive">
	 						<thead>
	 							<tr>
	 								<th>Nombre</th>
	 								<th>Apellido</th>
	 								<th>DNI</th>
	 								<th>Fecha Vencimiento</th>
	 								<th>Fecha Pago</th>
	 								<th>Monto</th>
	 								<th>Forma Pago</th>
	 								<th></th>
	 							</tr>
	 						</thead>
	 						<tbody>
	 						
	 						<%
									for (Cuota cuota : cuotalist) {
									%>
									<tr class="<%= (cuota.getUsuario().getId_usuario()+String.valueOf(cuota.getFecha_vencimiento())).equals(request.getAttribute("idFila"))?"table-secondary":""%>" id="<%=cuota.getUsuario().getDni()%>">
										<td><%=cuota.getUsuario().getNombre()%></td>
										<td><%=cuota.getUsuario().getApellido()%></td>
										<td><%=cuota.getUsuario().getDni()%></td>
										<td><%=cuota.getFecha_vencimiento()%></td>
										<td><%=cuota.getFecha_pago()!=null?cuota.getFecha_pago():"-"%></td>
										<td>$<%=cuota.getMonto()%></td>
										<td><%=cuota.getForma_pago()!=null?cuota.getForma_pago():"-"%></td>
										
											<!-- asignar pago -->
										<td>
											<div>
												<form action="ABMCCuota" method="post">
													<input type="hidden" class="custom-control-input" name="idUserLogin" value="<%=userLogin.getId_usuario()%>">
													<input type="hidden" class="custom-control-input" name="idUsuario" value="<%=cuota.getUsuario().getId_usuario()%>">
													<input type="hidden" class="custom-control-input" name="fechaVencimiento" value="<%=cuota.getFecha_vencimiento()%>">
													 <input type="hidden" class="custom-control-input" name="bandera" value="aModificar">
													<button type="submit" class="btn btn-warning" name="optionBM" value="modificacion" <%=cuota.getFecha_pago()!=null?"disabled":"" %>>Pagar</button>
												</form>
											</div>
										</td>

									</tr>
									<%				
									}
									%>
								</tbody>

							</table>
					
					</div>
				</div>
		</div>	
	
	
<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>

<script>
	document.getElementById('filtroDniBoton').addEventListener('click',filtros,false);
	document.getElementById('filtroCuotaImpaga').addEventListener('change',filtros,false);
	function filtros(){
		let listaDeFilas=document.getElementsByTagName("tr");
		if(document.getElementById("filtroDniTexto").value==""&& !document.getElementById("filtroCuotaImpaga").checked){
			for(let f=1;f<listaDeFilas.length;f++){
				listaDeFilas[f].hidden=false;
			}
		} //if, filtro dni esta vacio y checkbox no esta marcado
		if(document.getElementById("filtroDniTexto").value!=""&& !document.getElementById("filtroCuotaImpaga").checked){
			for(let f=1;f<listaDeFilas.length;f++){
				if(listaDeFilas[f].id==document.getElementById("filtroDniTexto").value){
					listaDeFilas[f].hidden=false;
				}else{
					listaDeFilas[f].hidden=true;
				}
			}
		} //if, filtro dni no esta vacio y checkbox no esta marcado
		if(document.getElementById("filtroDniTexto").value!=""&& document.getElementById("filtroCuotaImpaga").checked){
			for(let f=1;f<listaDeFilas.length;f++){
				let columnasDeFila=listaDeFilas[f].getElementsByTagName("td");
				if(listaDeFilas[f].id==document.getElementById("filtroDniTexto").value && columnasDeFila[4].innerHTML=="-"){
					listaDeFilas[f].hidden=false;
				}else{
					listaDeFilas[f].hidden=true;
				}
			}
		}//if, filtro dni no esta vacio y checkbox esta marcado
		if(document.getElementById("filtroDniTexto").value==""&& document.getElementById("filtroCuotaImpaga").checked){
			for(let f=1;f<listaDeFilas.length;f++){
				let columnasDeFila=listaDeFilas[f].getElementsByTagName("td");
				if(columnasDeFila[4].innerHTML=="-"){
					listaDeFilas[f].hidden=false;
				}else{
					listaDeFilas[f].hidden=true;
				}
			}
		}//if, filtro dni esta vacio y checkbox esta marcado
	}
</script>
</body>
</html>