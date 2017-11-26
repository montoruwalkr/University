require './Diccionario.rb'

diccionario = Diccionario.new

puts "Bienvenido(a) al Sistema de texto predictivo e indexación de nombres por sonido"
puts ""

puts "Ingresa el nombre y la extension de un fichero para crear tu Diccionario:"
fichero = gets.chomp
puts ""


puts "Cargando Diccionario - Creando Estructura de datos."
puts "..."
diccionario.leer(fichero)
puts "Estructura creada!"





r="si".chomp
while r=="si" do
	puts ""
	puts "Ingresa <1>[autocompletar] y <2>[fonetica]"
	accion = gets.chomp

	if accion == "1"
		puts ""
		puts "Bienvenido a autocompletar - Ingresa una palabra para recibir sugerencias."
		palabra = gets.chomp
		puts ""
		diccionario.autocompletar(palabra)
		puts""
		
	end

	if accion == "2"
		puts ""
		puts "Bienvenido a fonetica - Ingresa una palabra para recibir sugerencias."
		palabra = gets.chomp
		puts ""

		diccionario.compar_fonetica(palabra)
		puts""


	end

	puts "¿Desea continuar? | Ingresa <si> para continuar <no> para salir."
	r=gets.chomp
end

puts ""
puts "Gracias por utilizar nuestro sistema."
puts ""

puts "Creado por: "
puts "Alex Montoya Franco"
puts "José Orlando Rengifo Caicedo"

fin = gets
