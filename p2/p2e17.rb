# 17. Traspone un hash


def procesar_hash hash, lambda
    aux = {}
    hash.each do |key, value|
        aux[value] = lambda.call(key)
    end
    aux
end


hash = { 'clave' => 1, :otra_clave => 'valor' }
p procesar_hash(hash, ->(x) { x.to_s.upcase })
# => { 1 => 'CLAVE', 'valor' => 'OTRA_CLAVE' }

# Otra version a considerar (by Seba, ver https://github.com/SebaRaimondi/TTPS-Ruby-Practicas/blob/master/Practica-02/P02E17.rb) ...
def procesar_hash_v2 hash, block
	hash.invert.transform_values { | v | block.yield v } #podría ir tranquilamente un block.call v
end

# NOTA: 
# - El msj invert enviado a un hash swaps keys and values in a hash (no es destructivo, devuelve otro)
# - El msj transform_values enviado a un hash devuelve otro hash con los valores cambiados segun un bloque pasado que indica que hacer con cada valor
# - Haciendo {}/Hash.new creo un hash vacio, y despues hago hashCreado[newKey] = newValue para agregar una pos