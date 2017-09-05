#	6. Modificá la función anterior para que sólo considere como aparición del segundo string
#	cuando se trate de palabras completas. Por ejemplo:

#	contar_palabras("La casa de la esquina tiene la puerta roja y la ventana blan
#	ca.", "la")
#	# => 4

def contar (string1, string2)
    # Lo que hacemos es crear un arreglo con elementos = words del str y contar solo los q cumplen la cond
    string1.upcase.split.count {|word| word == string2.upcase}
end