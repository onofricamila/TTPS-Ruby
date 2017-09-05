#	14. Dado un color expresado en notación RGB (https://es.wikipedia.org/wiki/RGB) , debés calcular
#	su representación entera y hexadecimal, donde la notación entera se define como red +
#	green*256 + blue*256*256 y la hexadecimal como el resultado de expresar en
#	hexadecimal el valor de cada color y concatenarlos en orden. Por ejemplo:

#	notacion_hexadecimal([0, 128, 255])
#	# => '#0080FF'
#	notacion_entera([0, 128, 255])
#	# => 16744448

def notacion_hexadecimal (array)
    array.inject("") do | ac, element |
        ac + element.to_s(16).upcase
	end
end

def notacion_entera array
	array.each.with_index.inject(0) do |sum, (element, index)|
		sum + element * (256 ** index)
	end
end

#   NOTA: 
#   .se puede acceder a los elementos de un array haciendo array[0] + array[1] + array[2] 
#   .each.with_index == each_with_index 
#   .** == elevado a 
#   .In ruby 1.9.3 there is a chainable method called with_index which can be chained to each or map.
#   For example:
#        array.each.with_index.map { |item, index| item + index }
#   .Al hacer  array.each.with_index tengo como un hash con item => index
#       a = [1, 2, 3, 4]
#       a.each_with_index.map { |el, index| el + index }
#       => [1, 3, 5, 7]
#   .uso el inject para recorrer el hash


#   SEE --> str.ljust(2, "0") // si str.size > 2 agrega 0 a la izq (por la 'l')