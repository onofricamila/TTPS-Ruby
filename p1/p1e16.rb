#	16. Escribí una función que encuentre la suma de todos los números naturales múltiplos de
#	3 ó 5 menores que un número tope que reciba como parámetro.

def specialSum (limit)
    (1..limit).to_a.select{ |x| x % 3 == 0 || x % 5 == 0}.reduce(0) { |sum, element| sum + element }
end