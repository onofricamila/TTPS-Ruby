# 6. Analizá el siguiente código e indicá qué problema(s) puede tener.

# Tira un dado virtual de 6 caras
def tirar_dado
	rand 1..6
end

# Mueve la ficha de un jugador tantos casilleros como indique el dado en un tablero virtual de 40 posiciones.
# Si no se recibe la cantidad de casilleros, aprovecho el valor por defecto para ese parámetro para evitar tener que
# llamar a #tirar_dado dentro del cuerpo del método.
def mover_ficha (fichas, jugador, casilleros = tirar_dado)
	fichas[jugador] += casilleros
	if fichas[jugador] > 40
		puts "Ganó #{jugador}!!"
		true
	else
		puts "#{jugador} ahora está en el casillero #{fichas[jugador]}"
		fichas[jugador]
	end
end

posiciones = { azul: 0, rojo: 0, verde: 0 }
finalizado = false
until finalizado
	['azul', 'rojo', 'verde'].shuffle.each do | jugador| #shuffle randomly sorts an array
		finalizado = mover_ficha(posiciones, jugador)
	end
end

# CONCLUSION:
# 1. Cuando un jugador no gana, no devuelve false sino la posicion en el tablero la cual se entiende como true y por ende termina el juego :(
# 2. Si alguno gana termina el juego solo si es el ultimo, sino se ejecutan de todas formas los siguientes turnos por el each
# 3. Se está intentando acceder al hash fichas usando un string como key, cuando esta debería ser un símbolo.