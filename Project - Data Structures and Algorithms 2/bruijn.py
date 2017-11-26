'''Este archivo contiene la clase BruijnGraph el cual nos permite crear un objeto de este tipo
para que tiene metodos para crear el grafo y recorrerlo'''

'''importa la clase nodo del archivo nodoclass'''
from nodoclass import Nodo

class BruijnGraph:
    
    def __init__(self):
        self.nodos = {}
        self.dios = None
    
    '''Metodo que recibe un fragmento de longitud n y un entero k para el k-mers y agrega al grafo cada nodo
    nuevo encontrado en el fragmento con sus respectivas aristas'''
    def insert_seg(self, segmento, k):
                        
        for i in range( len(segmento) - k + 1 ):
            
            '''Si el padre ya se encuentra en el grafo '''
            
            if segmento[i:i+k-1] in self.nodos:
                
                '''Preguno si el hijo ya existe en el grafo'''
                if (segmento[i+1:i+k] in self.nodos) == False:
                    '''si no existe creo un nuevo hijo'''
                    hijo = Nodo(segmento[i+1:i+k], None, None)
                else:
                    '''Si existe asocio el hijo con el ya existente en el grafo'''
                    hijo = self.nodos[segmento[i+1:i+k]]
                
                '''Actualizo al padre referenciandolo con su hijo'''
                padre = self.nodos.get(segmento[i:i+k-1])
                padre.set_hijo(hijo)
                '''Actuliazo cual es el padre del hijo '''
                hijo.set_padre(padre)
                
                '''Actualizo los nodos en el Hashmap nodos'''
                self.nodos[segmento[i:i+k-1]] = padre
                self.nodos[segmento[i+1:i+k]] = hijo
                
            
            '''Si el padre no se encuentra en el grafo sucede lo mismo que arriba pero creo el nodo padre'''
            if (segmento[i:i+k-1] in self.nodos) == False:
                      
                '''Preguno si el hijo ya existe en el grafo'''
                if (segmento[i+1:i+k] in self.nodos) == False:
                    '''si no existe creo un nuevo hijo'''
                    hijo = Nodo(segmento[i+1:i+k], None, None)
                else:
                    '''Si existe asocio el hijo con el ya existente en el grafo'''
                    hijo = self.nodos[segmento[i+1:i+k]]
                    
                '''Creo el nodo padre'''
                padre = Nodo(segmento[i:i+k-1], None, hijo)
                hijo.set_padre(padre)
                
                if i == 0:
                    self.dios = padre        
                
                self.nodos[segmento[i:i+k-1]] = padre
                self.nodos[segmento[i+1:i+k]] = hijo
            
            cadena_dios = self.dios.get_cadena()
            diosactualizado = self.nodos[cadena_dios]
            
            '''actualiza siempre cual es el nodo padre del grafo'''
            if diosactualizado.get_padre() != None:
                nuevo_dios = diosactualizado.get_padre()
                self.dios = nuevo_dios
                
    '''Metodo para imprimir el grafo recursivamente, no funciona'''          
    def print_ADN(self,segmento, nodo):
        
        if segmento == "":
            
            nodo = self.dios
            tam = len(nodo.get_cadena())
            cadena = nodo.get_cadena() 
            segmento += cadena[tam-1]
            nodohijo = nodo.get_hijo()
            self.print_ADN(segmento, nodohijo)    
        
        elif nodo.get_hijo() == None:
            
            tam = len(nodo.get_cadena())
            cadena = nodo.get_cadena() 
            segmento += cadena[tam-1]
            archivo = open('nuevaCadena.txt','w')
            archivo.write(segmento)
            archivo.close()
            
        else:
            tam = len(nodo.get_cadena())
            cadena = nodo.get_cadena() 
            segmento += cadena[tam-1]
            nodohijo = nodo.get_hijo()
            self.print_ADN(segmento, nodohijo)
    
    '''Metodo que imprimie el grafo en un archivo'''
    def print_DNA(self, segmento, nodo, archivo):
        
        '''la primera vez que inicia el metodo el nodo va a ser igual al nodo padre del grafo'''
        if nodo == None:
            
            nodo = self.dios
            segmento += nodo.get_cadena()
            nodo = nodo.get_hijo()
        '''mientras que nodo no sea diferente de nulo, esto es que si no ha llegado al final del grafo, recorre el grafo y concatena la letra final de sus nodos'''
        while nodo != None:
            
            tam = len(nodo.get_cadena())
            cadena = nodo.get_cadena() 
            segmento += cadena[tam-1]
            nodo = nodo.get_hijo()
        
        archivo = open(archivo, 'w')
        archivo.write(segmento)
        archivo.close()          
    
    '''Meotod que imprime todos los nodos del grafo'''
    def print_grafo(self):
        print(self.nodos)
    '''Metodo que imprime el nodo padre del grafo'''    
    def print_dios(self):
        print(self.dios)
    '''Metodo que imprime la longitud del grafo, esto significa el numero de nodos'''
    def print_tam(self):
        print(len(self.nodos))