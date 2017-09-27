#	Ejercicio hecho por Seba-
#	Original --> https://github.com/SebaRaimondi/TTPS-Ruby-Practicas/tree/master/Practica-01

#	12. Escribí una función más genérica, parecida a la del ejercicio anterior, que reciba como
#	parámetro un string y un número n, y que realice una rotación de n lugares de las letras
#	del string y retorne el resultado. Por ejemplo:

#	rot("¡Bienvenidos a la cursada 2015 de TTPS Opción Ruby!", 13)
#	# => "¡Ovrairavqbf n yn phefnqn 2015 qr GGCF Bcpvóa Ehol!"

#VERSION 1
def rotv1(str, i = 1)
		i.times { str.gsub!(/[a-z]/i) { |c| c.succ } }
	return str
end

#	Preguntar, mismo problema que E11


#VERSION 2
def nextChar(n, char)
	if n > 0
		return nextChar(n-1, char.next)
	else
		return char
	end
end

def rot(str, i = 1)
	str.gsub(/[a-z]/i) { |c| nextChar(i, c)[-1] }
end