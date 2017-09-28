# 1. Escribí un método da_nil? que reciba un bloque, lo invoque y retorne si el valor de retorno del bloque fue nil.

def da_nil?
    yield.nil?
end

# El bloque no va como parametro sino detras de la llamada al metodo. Es como un falso param. 
# De esta forma funciona el yield

puts da_nil? { }
# => true
puts da_nil? {1 + 5}
# => false