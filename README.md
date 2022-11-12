# TPGimnasio-JAVA

## Alcance
Desarrollaremos un sistema/aplicación web cliente-servidor en Java sobre un gimnasio. En el mismo al momento que uno ingresa a la página principal el usuario podrá ver las diferentes opciones/ofertas que ofrece. Los niveles de accesos son: Invitado, Usuario, Encargado, Administrador.


_<b>Invitado (no requiere login).<br>
Usuario (cliente adherido a un plan del gimnasio).<br>
Encargado (un empleado del negocio, como recepcionista).<br>
Administrador (alguien que tiene permisos completos en la aplicación).</b>_

Un usuario si es la primera vez que ingresa al sistema será como invitado que solo tiene acceso a la página principal y a aquellas que no requieran el login.En la página principal podrá visualizar las diferentes ofertas/instalaciones del gimnasio. Si el usuario ya es miembro del gimnasio podrá loguearse en el sistema y caso contrario registrarse en el mismo. Al registrarse deberá proporcionar sus datos y seleccionar el plan de entrenamiento deseado. Una vez logueado tendrá acceso al menú de usuarios en el cual puede inscribirse al plan que desea, consultar cuotas y más.

El encargado tendrá acceso al menú de encargados en el cual puede ver historial de cuotas, actualizar datos de instructores, planes y más. El administrador tiene acceso al menú de admins. En el mismo un administrador podrá Crear, Modificar o Eliminar Usuarios, Planes, Rutinas, Ejercicios y mas. Podrá hacer consultas de cada entidad con sus respectivos listados. Puede realizar el listado de usuarios adheridos al gimnasio y a los diferentes planes, listado de los clientes que deban cuotas a pagar. Listados de los instructores, etc.



## Regularidad

|Requerimiento|cant. mín.<br>1 o 2 integ|cant. máx.<br>3 o 4 integ|Detalle/Listado de casos incluidos|
|:-|-:|-:|:-|
|ABMC simple|1 x integ|1 x integ|Usuario<br>Instructor<br>Grupo muscular
|ABMC dependiente|1|2|Cuota<br>Plan
|CU NO-ABMC|1|2| Inscripción Plan<br>Pago de cuota
|Listado simple|1|3(*)| 
|Listado complejo|0|1(*)|Listado de los clientes que deban cuotas a pagar

(\*) los grupos de 3 y 4 integrantes deben elegir entre 1 listado complejo o 3 simlples para regularizar.


## Aprobación Directa

|Requerimiento|cant. máx.<br>3 o 4 integ|Detalle/Listado de casos incluidos|
|:-|-:|:-|
|ABMC|todos|todos
|CU "Complejo"(nivel resumen)|2|Inscripción<br>Inscripción Plan<br>Dar de baja un plan<br>Notificar Disponibilidad(*)<br>Pagar Cuota<br>Notificar Vencimiento Cuota(**)<br>Crear/asignar Rutina
|Listado complejo|2| Listado de todas las rutinas con sus ejercicios.<br>Listado del histórico de todas las cuotas pagadas y pendientes de un determinado usuario.
|Nivel de acceso|2| Usuario<br>Encargado<br>Admin<br>Invitado
|Manejo de errores|obligatorio|obligatorio||
|requerimiento extra obligatorio (**)|0|Envío de emails|
|publicar el sitio|olbigatorio|obligatorio||

(\*\*) sólo grupos de 3 y 4 integrantes

(*) CU Notificar Disponibilidad: Cuando un Plan/Horario se encuentra con los cupos llenos, se le notifica al usuario de esto.

(**) CU Notificar Vencimiento de Cuota: Cuando un Usuario desea inscribirse a un Plan/Horario, si posee la cuota vencida, se le notifica.

## DER
![image](https://user-images.githubusercontent.com/102418096/201489349-8766b233-f718-4a77-a7f3-928548f59ff4.png)
