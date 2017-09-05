#	13. Escribí un script en Ruby que le pida al usuario su nombre y lo utilice para saludarlo
#	imprimiendo en pantalla ¡Hola, <nombre>!. Por ejemplo:

#	$ ruby script.rb
#	Por favor, ingresá tu nombre:
#	Matz
#	¡Hola, Matz!

puts "Enter your name"
name = gets.chomp
puts "Hello, #{name}!"