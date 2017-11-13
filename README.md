# PI
##  SISTEMA DE TICKETS DEL SERVICIO DE REFERENCIA PARA LA RED DE BIBLIOTECAS DE LA UNIVERSIDAD DE COLIMA (REBUC)

## Objetivo:
### Desarrollar un sistema que permita el registro y seguimiento de tickets de servicio aplicando técnicas de desarrollo y mantenimiento de software para dispositivos móviles.

## Descripción:
### La aplicación móvil será desarrollada para usarse en un dispositivo android que permita a la comunidad universitaria levantar tickets de servicio y a los bibliotecarios y responsables de bibliotecas de la Universidad de Colima dar seguimiento.

## Requerimientos:
#### 1. Permitir que cualquier usuario con correo @ucol.mx se registre para poder usar la aplicación móvil. Los datos mínimos requeridos del usuario son: nombre completo, correo, contraseña y plantel o dependencia.Contemplar en el diseño de base de datos la dependencia o plantel como una entidad independiente para que en el registro de usuarios se seleccione la dependencia de una lista predefinida.
#### 2. Permitir el inicio de sesión de usuarios validando correo y contraseña. Además contemplar en el diseño de la aplicación los siguientes roles: “universitario” “bibliotecario”, “responsable” y “administrador”.
##### *El “universitario” es cualquier usuario que tenga correo @ucol.mx.
##### *Los usuarios “bibliotecario”y “responsable” son los trabajadores que atenderán   los tickets de servicio y están asociados a una biblioteca de la Universidad.
##### *El “administrador” es el jefe de las bibliotecas de la Universidad.
##### *Permitir al “universitario” dar de alta tickets de servicio (poner en estado:”nuevo”). Además contar con un listado de los tickets solicitados y permitir ver los detalles de cada ticket de servicio.
##### *El ticket de servicio está compuesto por los datos generales: folio, usuario que solicita, petición o pregunta, estado actual(ejemplo: “en proceso”), fecha/hora de alta (actual) y fecha/hora de cierre(por default nula).
##### *Como detalle del ticket de servicio se contempla el historial del ticket con los datos: fecha/hora del movimiento, etiqueta del movimiento, Usuario que atiende, respuesta, comentario u observación.
##### *Que la aplicación considere tres estados principales y con etiquetas relacionadas para llevar en control del historial de movimientos. Los estados y etiquetas se listan a continuación:
###### *Nuevo
###### *En proceso
###### *Tomado
###### *Respondido por usuario
###### *Respondido por bibliotecario iv. Vuelto a abrir
###### *Transferido vi. Reasignado
###### *Asignado
###### *Cerrado
###### *Terminado
#### 5. Permitir al usuario “universitario” responder y/o calificar con 0-5 estrellas el servicio de referencia, lo que cierra el ticket.
#### 6. Permitir al “bibliotecario” tomar un ticket de servicio (cambiarlo de estado a: “en proceso”), y/o cerrarlo (cambiarlo de estado a: “cerrado”) con su respectiva respuesta, comentario u observación (campo de 500 caracteres).
#### 7. Permitir al “bibliotecario” dar respuesta a un ticket donde especifique en un campo abierto (500 caracteres) la solución, consejo o respuesta al usuario que dió de alta el ticket de servicio.
#### 8. Permitir al “responsable” cerrar, reasignar tickets de servicio a otro “bibliotecario” de su biblioteca, responder tickets directamente, reabrir o cerrar tickets y transferir tickets a otro “responsable” de otra biblioteca.
#### 9. Permitir al “responsable” asignar el rol de “bibliotecario” a un usuario.
#### 10. Permitir al “administrador” realizar las funciones del “bibliotecario” y “responsable”, pero además tiene un reporte de tickets donde puede buscar por número de ticket o persona que solicitó. Posterior a la búsqueda permite visualizar los datos generales de cada ticket de servicio y los movimientos(historial) de estados que tuvo.
#### 11. Permitir al “administrador” ver estadísticas básicas de cantidad total de tickets en un periodo de tiempo por: sistema, biblioteca, bibliotecario, dependencia del solicitante, por estado del ticket.
#### 12. Permitir al “administrador” asignar el rol de “bibliotecario” o “responsable” a un usuario.

# Integrantes y datos de contacto:
#### Rocio Rodriguez Niebla - rniebla@ucol.mx
#### Mario Ruben Saucedo Álvarez - msaucedo0@ucol.mx
#### Refugio Emmanuel Serrano Silva - rserrano5@ucol.mx
