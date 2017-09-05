#	7. Dada una cadena cualquiera, y utilizando los métodos que provee la clase String, realizá
#	las siguientes operaciones sobre el string:
#		1. Imprimilo con sus caracteres en orden inverso.
#		2. Eliminá los espacios en blanco que contenga.
#		3. Convertí cada uno de sus caracteres por su correspondiente valor ASCII.
#		4. Cambiá las vocales por números (a por 4, e por 3, i por 1, o por 0, u por 6).

str = "Una cadena cualquiera"


#		1. Imprimilo con sus caracteres en orden inverso.

p str.swapcase


#		2. Eliminá los espacios en blanco que contenga.

p str.delete(" ")


#		3. Convertí cada uno de sus caracteres por su correspondiente valor ASCII.

str.bytes


#		4. Cambiá las vocales por números (a por 4, e por 3, i por 1, o por 0, u por 6).

str.gsub( /[aeiou]/, 'a' => 4, 'e' => 3, 'i' => 1, 'o' => 0, 'u' => 6 )

#   Ruby has three useful methods for printing information 
#       print is the simplest of printing methods. print calls to_s on the object and spits it out to $stdout. New lines must be added manually when using print.
#       puts is similar to print – calling to_s – but adds a newline to the output.
#       p is similar to puts in that it adds a newline, but rather than calling to_s, p calls inspect. 
#
#   p can be more useful for debugging. As puts calls to_s, you can’t be exactly sure of what class an object is.
#   With p we get a better indicator of what we’re actually looking at.