# Metodos para que corran los tests

def incrementar(x, delta = 1)
    raise RuntimeError unless x.is_a? Numeric 
    x + delta
end

def concatenar(*arg)
    # armo un string con los elementos del array arg, separando cada uno con comillas
    # luego, como queremos ignorar los elementos del array que sean solo blancos para
    # que no distorcionen el string, hacemos un split del string resultado, metodo que
    # 'Divides str into substrings based on a delimiter, returning an array of these substrings.
    # If we ommit the delimiter, it asumes whitespaces'
    # Al array resultante que tiene solo palabras, lo convierto en un string con los elementos concatenados
    # separados por espacios :)
    arg.join(' ').split.join(" ")
end