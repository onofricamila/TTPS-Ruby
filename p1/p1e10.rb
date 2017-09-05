# 	10. Escribí una función llamada a_ul que reciba un Hash y retorne un String con los pares de
#	clave/valor del hash formateados en una lista HTML <ul>. Por ejemplo:

#	a_ul({ perros: 1, gatos: 1, peces: 0})
#	# => "<ul><li>perros: 1</li><li>gatos: 1</li><li>peces: 0</li></ul>"

def a_ul (hash)
    str= "<ul>"
    hash.each { |key, value| str+= "<li>#{key}: #{value}</li>" } #necesito comillas dobles para interpolar vars
    str+= "</ul>"
end

#   Otra versión a considerar:
   def a_ul_v2(hash)
       hash.reduce("<ul>") do | str, (sym, val) |
            str << "<li>#{sym.to_s}: #{val}</li>"
       end << "</ul>"
    end

# TEMER EM CUENTA:
#   .<<  --> hace un append (es destrctivo)
#   .reduce  --> es como el inject into de pharo. Acumula sobre una var (en este caso str)
#   .los bloques van entre llaves o do/end indistintamente
#   .si en el bloque no pones la var donde acumulas primero se rompe
#   .cuando mandas el reduce tenes que parametrizar el valor por el que inicias el acumulador. Sino, por defecto es 0 y tipo lo probe y te devuelve como otro hash de strings menos el primer elemento que se mantiene igual.
#   .si no pones las vars que hacen a la key y el value entre parentesis, podes poner una sola tipo 'asoc' que va a guardar el array que contiene a la clave y al valor. Despues adentro del bloque accedes a cada una haciendo #{array[0]} y #{array[1]}
#   .poniendo las vars key y value entre parentesis ya las toma como por separado.