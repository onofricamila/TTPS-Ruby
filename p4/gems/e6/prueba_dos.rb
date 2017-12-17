# si quiero ejecutar este archivo asi como esta desde consola debo ejecutarlo con bundle exec ruby prueba_dos.rb
# sino, deberia agregarle un require 'bundler' arriba para ejecutar el archivo con ruby prueba_dos.rb
Bundler.require
puts "Chau!", :red