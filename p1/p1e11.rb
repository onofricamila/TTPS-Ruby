#	11. Escribí una función llamada rot13 que encripte un string recibido como parámetro
#	utilizando el algoritmo ROT13 (https://es.wikipedia.org/wiki/ROT13) . Por ejemplo:

#	rot13("¡Bienvenidos a la cursada 2015 de TTPS Opción Ruby!")
#	# => "¡Ovrairavqbf n yn phefnqn 2015 qr GGCF Bcpvóa Ehol!"

#VERSION 1
def rot13v1(str)
		13.times { str.gsub!(/[a-z]/i) { |char| char.succ } }
        return str
end


#   POR QUÉ DA ESTO? => "¡Ovraaiiraavqbbff n yn phheeffnqn 2015 qr GGGGCCFF BBccpvóaa EEhholl!" REPITE LAS LETRAS QUE REEPLAZAN POR ENCRIPTACION A LAS POSTRIORES A LA M !!


#VERSION 2
def nextChar(n, char)
	if n > 0
		return nextChar(n-1, char.succ)
	else
		return char
	end
end

def rot13(str)
	str.gsub(/[a-z]/i) { |c| nextChar(13, c)[-1] }
end



#   NOTAS:
#   .sin el return en v1 devuelve 13
#   .Basically we’re replacing the matched portion of the string with the result of the block.


#   REGEXS:
#   Inside a character class (the [] inside the regex), you can list all the characters you want :
#       /[abcdefg]/
#   To gain some space, you can define a range with an hyphen (-) and a letter on each side of the - :
#       /[a-g]/
#   Since it's clear that this range is from a to g, you could write another character directly after :
#       /[a-gm]/
#   You could also define another range. A range can be followed by another range,
#   so [abcdwxyz] is equivalent to [a-dw-z]
#   You could also use a case insensitive regex :
#       string.gsub(/[a-z]/i)