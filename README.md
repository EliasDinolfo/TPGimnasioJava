# TPGimnasio-JAVA


## Regularidad

|Requerimiento|cant. mín.<br>1 o 2 integ|cant. máx.<br>3 o 4 integ|Detalle/Listado de casos incluidos|
|:-|-:|-:|:-|
|ABMC simple|1 x integ|1 x integ|Usuario<br>Plan<br>Instructor<br>Grupo muscular
|ABMC dependiente|1|2|Cuota(precio)<br>Horario
|CU NO-ABMC|1|2| Inscripción Plan<br>Pago de cuota
|Listado simple|1|3(*)| 
|Listado complejo|0|1(*)|Listado de los clientes que deban cuotas a pagar

(\*) los grupos de 3 y 4 integrantes deben elegir entre 1 listado complejo o 3 simlples para regularizar.


## Aprobación Directa

|Requerimiento|cant. máx.<br>3 o 4 integ|Detalle/Listado de casos incluidos|
|:-|-:|:-|
|ABMC|todos|todos
|CU "Complejo"(nivel resumen)|2|Inscripción<br>Inscripción Plan<br>Dar de baja un plan<br>Notificar Disponibilidad(*)<br>Pagar Cuota<br>Notificar Vencimiento Cuota(**)<br>Crear/asignar Rutina
|Listado complejo|2| Listado de todas las rutinas con sus repeticiones y ejercicios.<br>Listado del histórico de todas las cuotas pagadas y pendientes de un determinado usuario.
|Nivel de acceso|2| Usuario<br>Encargado<br>Admin<br>Invitado
|Manejo de errores|obligatorio|obligatorio||
|requerimiento extra obligatorio (**)|0|Envío de emails|
|publicar el sitio|olbigatorio|obligatorio||

(\*\*) sólo grupos de 3 y 4 integrantes

(*) CU Notificar Disponibilidad: Cuando un Plan/Horario se encuentra con los cupos llenos, se le notifica al usuario de esto.

(**) CU Notificar Vencimiento de Cuota: Cuando un Usuario desea inscribirse a un Plan/Horario, si posee la cuota vencida, se le notifica.
