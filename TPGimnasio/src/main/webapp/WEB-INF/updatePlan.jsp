<%@page import="entities.Horario"%>
<%@page import="logic.PlanesLogic"%>
<%@page import="entities.Rutina"%>
<%@page import="logic.RutinaLogic"%>
<%@page import="entities.Instructor"%>
<%@page import="java.util.LinkedList"%>
<%@page import="logic.InstructorLogic"%>
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
PlanesLogic pL=new PlanesLogic();
%>

<!-- Bootstrap core CSS -->
<link href="style/bootstrap.css" rel="stylesheet">
<!-- Custom styles for this template -->
<style><%@include file="/WEB-INF/estilos/estilo.css"%></style>
</head>
<body>
<%@ include file="/WEB-INF/MenuContextualAdmin.jsp"%>
<div class="">
		
		
			<form action="Conexion" method="post">
				<input type="hidden" class="custom-control-input"  name="alta" value="voleralmenu">
				<input type="hidden" class="custom-control-input"  name="idUserLogin" value="<%=userLogin.getId_usuario()%>">
				<button class="btn btn-primary" type="submit" name="optionBM" value="planes">Volver</button>	

			</form>
	
		</div>
		
		
<div class="container">
	
	
	<h2>Vuelva a ingresar todos los datos del Plan </h2>
	<form action="ABMCPlan" method="post">
	
	
			<% for(Instructor insytr : pL.getInstructores(p)){ %>
				<input type="hidden" class="custom-control-input" name="instructoresAntesModificar" value="<%=insytr.getDni()%>">
			<%} %>
			
			<div class="form-group  ">
				<label for="inputID" class=""> ID  Plan</label>
				<input id="inputID" name="idPlan" class="form-control text-center"  type="number" value="<%=p.getId_plan() %>" disabled>
			</div>
			
			<div class="form-group  ">
				<label for="inputNombre" class=""> Nombre</label>
				<input id="inputNombre" name="name" class="form-control "  type="text" value="<%=p.getNombre()%>" required>
			</div>
			
			<div class="form-group  ">
				<label for="inputDesc" class=""> Descripcion</label>
				<input id="inputDesc" name="description" class="form-control "  type="text" value="<%=p.getDescripcion() %>" required>
			</div>
			
			
			<div class="form-group row ">
				<label for="inputFechaExpiracion" class="col-5">Fecha de expiracion</label>
				<input id="inputFechaExpiracion" name="fechaExpiracion" class="form-control col-5"  type="date" value="<%=p.getFecha_expiracion() %>" required>
			</div>
			
	 	
	 	
	 	<div class="form-group mt-3 ">
				<label for="inputCosto" class=""> Costo del plan</label>
				<input id="inputCosto" name="costo" class="form-control "  type="number" value="<%=(pL.getCostoActualPlan(p)).getCosto() %>" required>
			</div>
			
		<%for(Horario ho: p.getHorarios()){ %>
		<div class="acja d-flex flex-row border justify-content-around align-items-center">
		
					<div class="form-group mt-3 ">
						<label for="inputHinicio" class=""> Hora Inicio</label>
						<input id="inputHinicio" name="horaInicio" class="form-control "  type="time" value="<%=ho.getHora_inicio() %>" disabled>
					</div>
			
					<div class="form-group mt-3 ">
						<label for="inputHfin" class=""> Hora Fin</label>
						<input id="inputHfin" name="horaFin" class="form-control "  type="time" value="<%=ho.getHora_fin() %>" disabled>
					</div>
				
					<div class="form-group  ">
						<label for="inputDias" class="">Dias de la semana de dictado</label>
						<input id="inputDias" name="diasSemana" class="form-control "  type="text" value="<%=ho.getDias_semana() %>" disabled>
					</div>
			
		</div>
			<%} %>
			
			
			
	
	 	
	 	
	 	<div class="cajon border mb-3">
      <h2>Elija el/los instructores del plan</h2>
      <p>Si no esta en la lista agregue el instructor desde el menu del administrador y luego regrese aqui.</p>
      
      <div class="table-responsive">
        <table class="table table-light  table-bordered">
          <thead class="table-dark">
            <tr>
              <th></th>
              <th>Nombre</th>
               <th>Apellido</th>
               <th>Tipo Doc.</th>
               <th>DNI</th>
               <th>E-mail</th>
               <th>Telefono</th>
            </tr>
             

        </thead>
        
      <%
      InstructorLogic cL=new InstructorLogic();
      LinkedList<Instructor> instructores=new LinkedList<Instructor>(); 
      instructores.addAll(cL.getAll()); 
      for(Instructor ins : instructores){
      %>
      <tbody >
        <tr>
          <td>
             <div class="form-check">
                <input class="form-check-input" type="checkbox" name="instructores" value="<%=ins.getDni()%>"  id="flexCheckDefault">
            </div>
          </td>
          <td><%=ins.getNombre()%></td>
          <td><%=ins.getApellido()%></td>
          <td><%=ins.getTipo_doc()%></td>
          <td><%=ins.getDni()%></td>
          <td><%=ins.getEmail()%></td>
          <td><%=ins.getTelefono()%></td>
         </tr>
      <%} %>
  
  
           </tbody>
        </table>
      </div>
      
      
      </div>
      
      
      		<div class="cajon border mb-3">
      <h2>Elija la/las rutinas del plan</h2>
      <p>Si no esta en la lista agregue la rutina desde el menu del administrador y luego regrese aqui.</p>
      
      <div class="table-responsive">
        <table class="table table-light  table-bordered">
          <thead class="table-dark">
            <tr>
              <th></th>
              <th>Rutina</th>
	 			<th>Nivel</th>
	 			<th>Comentario</th>
            </tr>
             

        </thead>
      <%
      RutinaLogic rL=new RutinaLogic();
      LinkedList<Rutina> rutinas=new LinkedList<Rutina>(); 
      rutinas.addAll(rL.getAll()); 
      for(Rutina rut : rutinas){
      %>
      <tbody >
        <tr>
          <td>
             <div class="form-check">
                <input class="form-check-input" type="checkbox" name="rutinas" value="<%=rut.getId_rutina()%>" id="flexCheckDefault">
            </div>
          </td>
          		<td><%=rut.getNombre()%></td>
		  		<td><%=rut.getNivel()%></td>
				<td><%=rut.getComentario()%></td>
         </tr>
      <%} %>
  
  
           </tbody>
        </table>
      </div>
      
      
      </div>
	 	
	 	
	 	
	 		<div class="form-group">
	 			<input type="hidden" class="custom-control-input"  name="idUserLogin" value="<%=userLogin.getId_usuario()%>">
	 			<input type="hidden" class="custom-control-input" name="idPlan" value="<%=p.getId_plan()%>">
	 			<input type="hidden" class="custom-control-input"  name="bandera" value="Modificado">
	 			<button type="submit" class="btn btn-warning" name="optionBM" value="modificacion">Enviar</button>
	 		</div>
	 		
												
	 	
	</form>

</div>
  <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>  

</body>
</html>