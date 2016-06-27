# recuCIU2016

Indicaciones
Los trabajos deberán estar funcionando completamente a la hora de entregar sin errores. No se aceptarán entregas con errores por lo que pedimos a quienes entregan que si necesitan utilizar las máquinas de la facultad dejen configurado su TP en las mismas con anticipación a la hora de entrega.
El recuperatorio es individual. 
Es necesario versionar el código en algún repositorio de código. Se sugiere github o bitbucket.

Dominio
Parece cada vez más complicado responder la pregunta ¿a dónde se va el dinero? es por eso que nos pidieron que desarrollemos un sistema para el control de gastos que, además, nos permita realizar algunos reportes. Para ello nos pidieron que el sistema cumpla con los siguientes requerimientos:
El sistema debe ser (y soportar) multi-usuario, es decir que es indispensable autenticarse en el sistema
Se debe contemplar el registro del usuario al sistema, al registrarse se pide:
nombre de usuario ⇒ debe ser único
password ⇒ debe tener al menos 5 caracteres y contener al menos un número (puede ser exclusivamente numérico)
Se deben poder cargar gastos en el sistema
Un gasto siempre queda asociado al usuario que lo ingresó
De los gastos solo nos importa: 
fecha de creación del gasto: asumimos que es la misma fecha del gasto
descripción
monto: el monto debe ser numérico y un valor positivo
Una vez logueado se debe poder obtener la siguiente información:
Listado de todos los gastos ingresados 
Visualizar el total de los gastos
Filtrar los gastos por descripción. Cuando se filtran los gastos también se debe ver el total de los gastos filtrados
Obtener el índice de inflación acumulada para una descripción de gastos en un año
Una posible implementación del índice inflacionario es calcular las variaciones mes a mes de los gastos bajo el mismo concepto y acumular el porcentaje total. Por ejemplo: si quisiera saber la inflación según el concepto “Fibertel”



Recuperatorio de TP1: Desktop usando Arena
- Pantallas
- Login y registro (la pantalla debe ofrecer ambas alternativas), una posible pantalla:
- Ingresar gastos y acceder a índice inflacionario
- Consultar el índice inflacionario



Recuperatorio de TP2: Web usando Angular
Pantallas
- Login
- Registración
- Ingresar gastos y realizar consultas


Servicios
Debe de contar al menos con los siguientes servicios:

- login ⇒ post
recibe nombre de usuario y contraseña
si es correcto devuelve los datos necesario para mostrar la pantalla principal
si es incorrecto devuelve lo necesario para indicar el error (puede ser el código de retorno HTTP que indica el error)

- registracion ⇒ put
recibe nombre de usuario y contraseña
si es correcto devuelve los datos del login (la pantalla ingresa al sistema)
si es incorrecto informa el error

- gastos ⇒ put
recibe descripcion, monto y id-usuario
devuelve la nueva información del usuario (gastos y total gastado)

- gastos ⇒ get
recibe una descripción buscada
devuelve los gastos que cumplen el criterio y el total parcial

- indice ⇒ get o post
recibe el año y la descripción
devuelve el índice calculado y la explicación (el detalle mes a mes)
