#	HICE sudo apt-get install -f para arreglar el tema de que cargue las dependencias que necesitaba

#   3. Escribí una función llamada reemplazar que reciba un String y que busque y reemplace
#	en el mismo cualquier ocurrencia de { por do\n y cualquier ocurrencia de } por \nend, de
#	modo que convierta los bloques escritos con llaves por bloques multilínea con do y end.
#	Por ejemplo:

#	reemplazar("3.times { |i| puts i }")
#	# => "3.times do\n |i| puts i \nend"

def reemplazar(string)
    string.gsub(/[{}]/, '{' => 'do\n', '}' => ' \nend') 
end