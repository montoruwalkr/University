'''Archivo que contiene la clase nodo'''
class Nodo:
    
    '''El objeto nodo contiene una referencia con el nodo padre, su nodo hijo y la cadena de longitud k'''
    def __init__(self, cadena, padre, hijo):
        self.__cadena = cadena
        self.__padre = padre
        self.__hijo = hijo
    
    '''getters de la clase nodo'''
    def get_cadena(self):
        return self.__cadena
    
    def get_padre(self):
        return self.__padre
    
    def get_hijo(self):
        return self.__hijo
    
    '''Setters de la clase nodo'''
    def set_cadena(self, cadena):
        self.__cadena = cadena
    
    def set_padre(self, padre):
        self.__padre = padre
        
    def set_hijo(self, hijo):
        self.__hijo = hijo
    
    