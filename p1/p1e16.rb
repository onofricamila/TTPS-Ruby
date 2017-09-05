#	16. Escribí una función que encuentre la suma de todos los números naturales múltiplos de
#	3 ó 5 menores que un número tope que reciba como parámetro.

def specialSum (limit)
    (1..limit).to_a.select{ |x| x % 3 == 0 || x % 5 == 0}.sum
end

#   NOTA: existe el msj sum para sumar los elementos de un array, lo que permite llegar a una 
#   solución copada, que equivale a hacer uso del reduce: 
#   --> [1, 1, 1].reduce(0) { |sum, element| sum + element } => 3
#   --> [1, 1, 1].sum => 3

#   to_a es un msj que se le envia a un rango para crear un array cuyos elementos seran los del rango