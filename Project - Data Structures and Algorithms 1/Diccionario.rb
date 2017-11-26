#Arcihvo que contiene la clase Diccionario

#requiere archivo que contiene las clases Nodo y NodoPadre
require './Nodo.rb'

#Clase Diccionario crea el arbol y tiene los metodos autocompletar y fonetica
class Diccionario

	#permite acceder a las variables desde otros ficheros
	attr_accessor :hash, :a_postfijo

	def initialize 
		@hash = Hash.new
		@a_postfijo = Array.new
		@a_fonetica = Array.new

	end

=begin
Metodo que recibe un caracter(key), pregunta si esta en el hash, 
si esta retorna el nodo(value), si no existe crear una nueva key para ese valor. 
=end
	def obtener_nodo_Padre caracter

		existe = @hash.include?(caracter)

		if existe

			nodo_padre = @hash[caracter]

		end
		#mientras que no exista el key entonces creo un nuevo key y le asigno un valor(nodo)
		unless existe

			nodo_padre = @hash.store( caracter, NodoPadre.new(caracter) )

		end

		return nodo_padre

	end 
=begin
Metodo leer(file) recibe el Diccionario y crea el arbol
=end
	def leer file

		File.open(file, 'r') do |linea|  

			while word = linea.gets
				npalabra = word.chomp
				tam = npalabra.length
			

					for i in 0...tam

						#para el primer caracter de la palabra
						if i == 0
							nodo_padre = obtener_nodo_Padre(npalabra[i])
							last_nodo = nodo_padre

							
						elsif i == (tam-1)


							existe = last_nodo.existeHijo(npalabra[i])


							if existe

								nodo = last_nodo.retornarHijo(npalabra[i])

								nodo.set_palabra true


								nodo_padre.agregarHoja(nodo)

							
							else
								nodo = Nodo.new(npalabra[i],true,last_nodo)

								last_nodo.agregarHijo nodo

								nodo_padre.agregarHoja(nodo)



							end

						#Para todo valor i tal que 0<i<palabra.length
						else

							existe = last_nodo.existeHijo(npalabra[i])

							if existe

								nodo = last_nodo.retornarHijo npalabra[i]

								last_nodo = nodo

							end

							unless existe

								nodo = Nodo.new(npalabra[i],false,last_nodo)

								last_nodo.agregarHijo nodo

								last_nodo = nodo

							end

						end


					end
					
			end 

		end

    end
=begin
El metodo autocompletar(palabra) recorre el arbol y verifica si la palabra 
ingresada se encuentra en el arbol, si se encuentra retorna los posibles postfijos
para esa palabra si no, manda un mensaje de error
=end
    def autocompletar palabra

		npalabra = palabra.chomp
	
		for i in 0..npalabra.length

			if i == 0

				if npalabra.length == 1

					nodo_padre = @hash[npalabra[i]]
					last_nodo = nodo_padre
					if npalabra.length == 0
						arreglo_postfijos(nodo_padre,"",npalabra)
						break
					end

				else

					if @hash.include? npalabra[i]

						nodo_padre = @hash[npalabra[i]]
						last_nodo = nodo_padre

					else

						puts "No existen sugerencias en el Diccionario para esta palabra."
						puts ""
						break
					end

				end


			elsif i == (npalabra.length - 1)

				nodo =  last_nodo.retornarHijo(npalabra[i])

				last_nodo = nodo

				palabra_original = npalabra[0...npalabra.length-1]

				t1 = Time.now
				arreglo_postfijos(last_nodo,"",palabra_original)
				t2 = Time.now
				tiempo = t2-t1
				puts "Tiempo de busqueda: #{tiempo}"


				if @a_postfijo.empty?

			   		puts "No existen sugerencias en el Diccionario para esta palabra."
				    puts ""
			   		break

			   	end

			   	unless @a_postfijo.empty?

			   		puts "*Sugerencias de autocompletado:"

			   		for i in @a_postfijo

			   			puts ">> #{i}"


			   		end
			   			puts ""
			   			puts "*se encontraron #{@a_postfijo.length} coincidencias"
			   			@a_postfijo = [] 
			   		break
			   		
			   	end 

			else

				if last_nodo.existeHijo(npalabra[i])

					last_nodo = last_nodo.retornarHijo(npalabra[i])

	
				else

					puts "No existen sugerencias en el Diccionario para esta palabra."
				    puts ""
					break
				end 


			end

				

		end
				
	end


	def arreglo_postfijos(nodo,word,palabra_original)

		if nodo.n_Hijos == 0
			word = "#{word}#{nodo.get_caracter}"
			fin_palabra = "#{palabra_original}#{word}"
			@a_postfijo << fin_palabra
		else
			word = "#{word}#{nodo.get_caracter}"
			
			if nodo.get_palabra 
				fin_palabra = "#{palabra_original}#{word}"
				@a_postfijo << fin_palabra
			end


			for i in nodo.a_Hijos
				arreglo_postfijos(i,word,palabra_original)
			end
		end

	end

=begin
metodo compar_fonetica(palabra) se encarga de recibir una palabra



=end

	def compar_fonetica(palabra)

		fpalabra = palabra.chomp

		sufijo_fonetica = fpalabra[fpalabra.length-3...fpalabra.length]

		ult_caracter = fpalabra[fpalabra.length-1]

		nodos_padre = @hash.values

		tam_palabra = fpalabra.length

		for i in nodos_padre

			nodo_padre_arbol = i

			arreglo_hojas_padre = nodo_padre_arbol.buscarHoja(ult_caracter)

			for j in arreglo_hojas_padre

				busqueda_arriba(sufijo_fonetica,sufijo_fonetica,j,tam_palabra,fpalabra)				

		    end

		end

		if @a_fonetica.empty?

			puts "No existen sugerencias en el Diccionario para esta palabra."
		    puts ""

	    end

	   	unless @a_fonetica.empty?

	   		a_fonetica_sort = @a_fonetica.sort

	   		puts "*Sugerencias foneticas:"

	   		for i in a_fonetica_sort

	   			puts ">> #{i}"


    		end
    		puts ""
    	    puts "Se encontraron #{@a_fonetica.length} coincidencias."
			@a_fonetica = [] 
			   		
	    end 

	end

	def busqueda_arriba(sufijo_forever,sufijo_fonetica,nodo_hoja,tam_palabra,palabra_original)	

		if sufijo_fonetica.length == 0

			busqueda_prefijo(sufijo_forever,nodo_hoja,tam_palabra,palabra_original)


	    else

	    	if nodo_hoja.tiene_nodo_padre == true

	    		nodo_padre = nodo_hoja.get_padre

	    		caracter_nodo_padre = nodo_padre.get_caracter

	    		nsufijo_fonetica =  sufijo_fonetica[0...sufijo_fonetica.length-2]

	    		nult_caracter = sufijo_fonetica[sufijo_fonetica.length-2]

	    		if caracter_nodo_padre == nult_caracter

	    			busqueda_arriba(sufijo_forever,nsufijo_fonetica,nodo_padre,tam_palabra,palabra_original)

	    		end

	    	end


	    end

    end

    def busqueda_prefijo(sufijo_forever,nodo,tam_palabra,palabra_original)

		tiene = nodo.tiene_nodo_padre

			if tiene == false

				if (sufijo_forever.levenshtein palabra_original) < 2

					@a_fonetica << sufijo_forever

				end

		    else

		    	nodo_padre = nodo.get_padre

		    	sufijo_forever = "#{nodo_padre.get_caracter}#{sufijo_forever}"

		    	busqueda_prefijo(sufijo_forever,nodo_padre,tam_palabra,palabra_original)


		    end  	

    end

end

class String
  def levenshtein(other)
    other = other.to_s
    distance = Array.new(self.size + 1, 0)
    (0..self.size).each do |i|
      distance[i] = Array.new(other.size + 1)
      distance[i][0] = i
    end
    (0..other.size).each do |j|
      distance[0][j] = j
    end

    (1..self.size).each do |i|
      (1..other.size).each do |j|
        distance[i][j] = [distance[i - 1][j] + 1,
                          distance[i][j - 1] + 1,
                          distance[i - 1][j - 1] + ((self[i - 1] == other[j - 1]) ? 0 : 1)].min
      end
    end
    distance[self.size][other.size]
  end
end

