class Nodo

	attr_accessor :caracter, :palabra,:hijos, :frecuencia, :padre

	def initialize(caracter,palabra,padre)

		@caracter = caracter 
		@palabra = palabra
		@hijos = Array.new
		@padre = padre
		@frecuencia = 1

	end

	def get_caracter
		return @caracter
	end

	def get_palabra
		@palabra
	end

	def get_padre
		@padre

	end

	def tiene_nodo_padre 


		if @padre == nil

			return false

		else

			return true
		end

	end

	def set_palabra palabra
		@palabra = palabra
	end

	def n_Hijos

		return @hijos.length

	end

	def a_Hijos

		return @hijos
	end

	def agregarHijo hijo

		@hijos << hijo

	end

	def existeHijo letra

		existe = false


		unless @hijos.empty?

			for i in @hijos

				if i.get_caracter == letra
					existe = true
				end
			end

		end

		return existe

	end

	def retornarHijo letra
		

		for i in @hijos
			if i.caracter == letra
				hijo = i
			end
		end

		return hijo

	end

	def incrementarFrecuencia

		@frecuencia += 1 

	end

end

require './Nodo.rb'

class NodoPadre < Nodo

	attr_accessor :hojas

	def initialize (caracter)

		super(caracter,false,nil)

		@hojas = []

	end


	def agregarHoja hoja

		@hojas << hoja
	end

	def buscarHoja letra

		lista = []

		for i in @hojas
			if i.caracter == letra
				lista << i
			end
		end

		return lista

	end

end