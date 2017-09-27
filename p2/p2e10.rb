# Modulo Reverso
module Reverso
    def di_tcejbo # Imprime el object_id del receptor en espejo (en orden inverso).
        puts self.object_id.to_s.reverse
    end
    def ssalc #Imprime el nombre de la clase del receptor en espejo.
        puts self.class.to_s.reverse
    end
end

# Pruebo el modulo anterior con una clase cualquiera

class ReversoTest
    include Reverso
end

# NOTA: reverse es un metodo que sirve tanto para strings como arrays

# Test:
test = ReversoTest.new
test.di_tcejbo
test.ssalc