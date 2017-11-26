'''Archivo principal del programa el cual es el que interactua con el usuario recibe el archivo por consola y genera la cadena de ADN'''


'''importo BruijnGraph del archivo bruijn'''
from bruijn import BruijnGraph
''''''
from time import time

print("Algoritmo de secuenciamiento de cadenas de ADN")
print("")
print("")
termina = 0

'''ciclo que permite la interaccion con el usuario'''
while(termina !=  1):   
    
    nom_archivo = raw_input("Ingrese el nombre del archivo (*.txt) con las fragmentos de ADN: ")
    print("Creando grafo...\n")
    grafo = BruijnGraph()
    
    ''' Abrir archivo de fragmentos'''
    archivo = open(nom_archivo, 'r')
    
    ''' Ciclo para recorrer los fragmentos de ADN del archivo ingresado'''
    start_time = time()
    for i,line in enumerate (archivo):
        
        if len(line)!=1:
            line = line[0:len(line)-1]
            grafo.insert_seg(line, 201)

    archivo.close()
    print("Se ha creado el grafo con exito")
    elapsed_time = time() - start_time
    print("Tiempo de creacion: %.10f segundos.\n" % elapsed_time)
    respuesta = raw_input("Desea imprimir el ADN   Ingrese si/no: ")
    if respuesta == "si":
        
        nueva_cadena = raw_input("Ingrese el nuevo nombre del archivo que desee para la cadena:")
        grafo.print_DNA("", None, nueva_cadena)
        print("Se ha imprimido el archivo con exito revise el archivo \n")
        
        respuesta2 = raw_input("Desea imprimir las proteinas: si/no: ")
        
        if respuesta2 == "si":
            
            aminoacidos = []
            genes = []
            proteinas = []
            proteinas_final = []
            original = 't'
            reemplazo ='u'
            archivo = open(nueva_cadena , 'r')
            archivo_arn = open('ARN.txt','w')
            archivo_aminoacidos = open('aminoacidos.txt','w')
            archivo_proteinas = open('proteinas.txt','w')
            cont=0
            pro=""
            gen=""
            v=False
            final=""
            total=""

            c=0
            for arn in archivo:
                 if len(arn)!=1:
                    arn = arn[0:len(arn)]
                    arn = arn.replace(original, reemplazo)
                    #print(arn)

            for i in arn:
                    pro+=i
                    cont = cont + 1
                    if cont==3:
                            aminoacidos.append(pro)
                            cont=0
                            pro=""

            #genes de 3 en 3, inicia la proteina con ATG y finaliza con 
            # TAA,TGA o TAG

            #genes de 3 en 3, inicia la proteina con AUG y finaliza con 
            # UAA,UGA o UAG

            #desde AUG hasta UAA

            for i,x in enumerate(aminoacidos[:]):


                    if x=='aug':
                            v=True
                            proteinas.append(x)
                            final += x

                    if x!= 'aug' and v==True:
                            proteinas.append(x)
                            final += x

                    if v==True and (x=='uaa' or x=='uga' or x=='uag'):
                            final+=x
                            proteinas.append("STOP")
                            total = final
                            proteinas_final.append(total)
                            final=""
                            v=False


            

            archivo_arn.write(arn)
            archivo_aminoacidos.write(str(aminoacidos))
            archivo_proteinas.write(str(proteinas_final))
            # Cerramos el fichero.
            archivo.close()
            archivo_arn.close()
            archivo_aminoacidos.close()
            archivo_proteinas.close()
            
            print("Se encontraron las proteinas con exito")
            print("Hay ", len(proteinas_final), " proteinas en el ADN")
            print("")
            
        else:
            
            termina = 1
            print("Gracias por usar nuestro sistema")
            print("Elaborado por:")
            print("Jose Rengifo")
            print("Alex Montoya")
            break


    else: 
        termina = 1
        print("Gracias por usar nuestro sistema")
        print("Elaborado por:")
        print("Jose Rengifo")
        print("Alex Montoya")
        break
    
    respuesta3 =  raw_input("Desea generar otra cadena Ingrese si/no")
    
    if respuesta3 == "no":
        
        print("Gracias por usar nuestro sistema")
        print("Elaborado por:")
        print("Jose Rengifo")
        print("Alex Montoya")
        termina = 1