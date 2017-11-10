# PRACTICA 1

# CONTAR --> dice las veces que se encuentra un substring dentro de otro
def contar (string1, string2)
    string1.upcase.scan(string2.upcase).count
end

# LONGITUD --> dado un arreglo de strings te devuelve otro con la length de cada string
def strLengthArray(array)
    array.map { |x| x.length}
end


# PRACTICA 2

# ORDENAR_ARREGLO --> recibe un array de numeros y hace sort
def ordenar_arreglo array
    array.sort
end

# DA_NIL? --> evalua un bloque y dice si da nil la eval o no
def da_nil?
    yield.nil?
end