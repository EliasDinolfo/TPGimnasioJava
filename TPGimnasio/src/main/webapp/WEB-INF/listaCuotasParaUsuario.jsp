<%@page import="entities.Plan"%>
<%@page import="java.util.LinkedList"%>
<%@page import="entities.Usuario"%>
<%@page import="entities.Cuota"%>
<%@page import="logic.CuotaLogic"%>
<%@page import="java.time.LocalDate"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>

<%
Usuario userLogin = (Usuario) session.getAttribute("usuarioLogin");
CuotaLogic cl = new CuotaLogic();
LinkedList<Cuota>cuotas = cl.getAllPorUsuario(userLogin);
String estado_cuota;
%>

<!-- Bootstrap core CSS -->
<link href="style/bootstrap.css" rel="stylesheet">
<!-- Custom styles for this template -->
<style><%@include file="/WEB-INF/estilos/estilo.css"%></style>
</head>
<body>
	<%@ include file="/WEB-INF/MenuContextualUsuario.jsp"%>
	<div <%=request.getAttribute("mensaje")==null ? "hidden": ""%> class="alert-dismissible <%=request.getAttribute("color")%>">
            <p><%= request.getAttribute("mensaje") %></p>
            <button type="button" class="close" data-dismiss="alert">
            <span>x</span>
            </button>
    </div>   
    <h2>Lista de cuotas: <%=userLogin.getUsername() %></h2>
    <div class="col-12 col-sm-12 col-lg-12">
	 				<div class="table-responsive">
	 					<table class="table">
	 						<thead>
	 							<tr>
	 								<th>Fecha Vencimiento</th>
	 								<th>Monto</th>
	 								<th>Forma de Pago</th>
	 								<th>Estado</th>
	 								<th></th>
	 							</tr>
	 						</thead>
	 						<tbody>
	 						
	 						<%for (Cuota cuota : cuotas ) {%>
									<tr class="<% 
									if(cuota.getFecha_pago()!=null){
										out.print("bg-success");
										estado_cuota="Paga";
									}else if(cuota.getFecha_vencimiento().isAfter(LocalDate.now())){
										out.print("bg-warning");
										estado_cuota="Pendiente";
									}else{
										out.print("bg-danger");
										estado_cuota="Vencida";
									}
									%>">
										<td><%=cuota.getFecha_vencimiento()%></td>
										<td>$<%=cuota.getMonto()%></td>
										<td><%=cuota.getForma_pago()==null?"":cuota.getForma_pago() %></td>
										<td><%=estado_cuota%></td>
										<td>
											<!-- pagar cuota -->
											<div>
												<form action="ABMCCuota" method="post">
													<input type="hidden" class="custom-control-input" name="idUserLogin" value="<%=userLogin.getId_usuario()%>">
													<input type="hidden" class="custom-control-input" name="idUsuario" value="<%=cuota.getUsuario().getId_usuario()%>">
													<input type="hidden" class="custom-control-input" name="fechaVencimiento" value="<%=cuota.getFecha_vencimiento()%>">
													<input type="hidden" class="custom-control-input" name="bandera" value="aModificar">
													<button type="submit" class="btn btn-primary" name="optionBM" value="modificacion" <%=cuota.getFecha_pago()!=null?"disabled":""%>>Pagar</button>
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
					
<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
</body>
</html>