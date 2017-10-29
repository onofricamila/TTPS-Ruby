# 21. Extender la clase Array para que tenga el metodo randomly que:
#   -Si recibe un bloque, debe invocar ese bloque con cada uno de los elementos del
#    arreglo en orden aleatorio.
#   -Si no recibe un bloque, debe devolver un enumerador que va arrojando, de a uno,
#    los elementos del arreglo en orden aleatorio

class Array
    def randomly(block=nil)
        if block_given?
            self.shuffle.each { |i| yield(i) }
          else
            aux = self.shuffle.to_enum
            loop{aux.next}  # el loop corta cuando se queda sin valores que devolver el enumerator
        end        
    end

    # version de Seba, ver --> https://github.com/SebaRaimondi/TTPS-Ruby-Practicas/blob/master/Practica-02/P02E21.rb
    def randomly_v2
		return self.shuffle.map { |x| yield x }
	    rescue LocalJumpError => e  # LocalJumpError is raised when Ruby can't yield as requested. A typical scenario is attempting to yield when no block is given:
		return self.each    # genera un Enumerator al no recibir parametros el each
    end

    # version de Pedro, ver --> https://github.com/pedrobrost/Facultad_Informatica_UNLP/blob/master/Ruby/practica2.md
    def randomly_v3 &block
        shuffle.each &block
    end    
end


# NOTA:
# EL YIELD EJECUTA ASI SOLITO TANTO UN BLOQUE PARAM COMO ADYACENTE A LA LLAMADA
# YIELD (exe implicit block param) vs EXPLICIT_BLOCK.CALL
# myArray.sample --> will return 1 random value.
# myArray.shuffle.first --> will also return 1 random value.

