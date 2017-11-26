-------------------------Información de la Entrega----------------------------

SAP - 1
Hecho por: Alex Montoya Franco - Ricardo Jaramillo
Materia: Teoria de la Conmutación
Semestre: 2017-1
Docente: Edwin Fernando Giraldo Aristizabal
Fecha de Entrega: 06/04/2017

El SAP-1 permite realizar las operaciones basicas de suma, resta, multiplicación,
division y modulo, ademas detecta la división por cero

------------------------------------------------------------------------------



----------------------------Recursos utilizados-------------------------------

Proteus 8 Professional: https://www.labcenter.com/
Arduino: https://www.arduino.cc/
IC-Prog: http://www.ic-prog.com/

------------------------------------------------------------------------------



-----------------------Información a tener en cuenta--------------------------

* Cuando se desee verificar un programa en Arduino debe seleccionarse la placa
Mega, esto se hace ubicandose en el menú Herramientas, click en Placa y
seleccionando Arduino/Genuino Mega or Mega 2560

* Ya que en el SAP es necesario hacer uso del archivo compilado por Arduino en 
hexadecimal,debe habilitarse la informacion de la compilacion, esto se hace 
ubicandose en el menú Archivo, seleccionar la opcion preferencias y hacer click 
en la opción compilacion.

* En IC-Prog debe seleccionarse en el menú desplegable la opción -89S53-

* El estandar para el decodificador de instrucciones es:

	1 1 1 1 -- LDA
	1 1 1 0 -- ADD
	1 1 0 1 -- SUB
	1 1 0 0 -- MUL
	1 0 1 1 -- DIV
	1 0 1 0 -- MODULE 
	1 0 0 0 -- OUT

	0 1 1 1 -- HLT

------------------------------------------------------------------------------



-------------------------------Elementos del SAP 1----------------------------

MAR: Guarda la posicion de memoria de la instrucción que se esta ejecutando
y aumenta su contador hasta un maximo de 16.

PROM: Almacena las palabras de 8 bits cargadas por un archivo en binario generado
por el programa IC-PROG.

INSTRUCTION REGISTER: Procesa la palabra de 8 bits y la divide en dos palabras mas
pequeñas, 4 bits que representan el numero y otros 4 que representan la operacion
que se desea realizar.

ACUMULATOR A: Almacena la respuesta mientras el computador esta en funcionamiento
y se realizan las distintas operaciones.

ALU: Unidad logica aritmetica que ejecuta las operaciones suma, resta, 
multiplicacion y division.

REGISTER B: Se usa para hacer todas las operaciones con el acumulador.

REGISTER C: Se usa para hacer las operaciones relacionadas con el modulo.

OUTPUT REGISTER: Display binario del registro de salida, muestra el contenido
transferido desde el acumulador.

PC AND CONTROL UNIT: Hace un computador lo que es, envia las señales para el
registro de instrucciones y para operar las intrucciones (Enable) y (Load)
ubicadas en el SAP.

------------------------------------------------------------------------------



-------------------------------Instrucciones de uso----------------------------

1. Previamente tener el programa de IC-Prog guardado en binario y tener los
programas en arduino compilados.

2. Insertar el programa de IC-PROG en la PROM, esto se hace seleccionando
la placa y seleccionando en Image File el archivo .bin que generamos en
el programa.

3. Insertar la ruta del archivo (SAP_ARDUINO) compilado en hexadecimal en
la unidad de control, esto se hace seleccionando la placa de arduino y 
pegando la ruta en el campo PROGRAM FILE.

4. Se inserta de igual forma el archivo (SAP_DISPLAY) pero en esta ocasión 
en la placa del Output Register.

5. Ejecutar la simulacion y observar el resultado en el binary display.

------------------------------------------------------------------------------



