#	8. ¿Qué hace el siguiente código?

p ([:upcase, :downcase, :capitalize, :swapcase].map do | meth|
	"TTPS Ruby".send(meth)
    end)


#   Lo que hace es enviarle el msj map a un arreglo de longitud 4, cuyos elementos son simbolos que
#   coinciden con mjs que entienden los strings. Por lo tanto, se retorna un nuevo arreglo que va a 
#   contener los resultados de enviarle al string "TTPS Ruby" los msjs del array original.

