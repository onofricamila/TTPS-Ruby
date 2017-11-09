# Crea una nueva clase de exception para detectar un numero entero invalido

class NaturalInvalid < RangeError
    def message
      "¡¡¡¡¡ Se ingresó un número incorrecto. !!!!!"
    end
end

begin
    cantidad = 0
    puts '¿Cuál es la cantidad de números que ingresará? Debe ser al menos 15'
    cantidad = gets.to_i

    raise NaturalInvalid  if cantidad < 15
    rescue NaturalInvalid => e
        puts e.message
        puts "Debe ingresar un número mayor o igual a 15. Intente nuevamente:"
        retry
end

begin
    # Luego se almacenan los números
    numeros = 1.upto(cantidad).map do
        puts 'Ingrese un número'
        numero = gets.to_i
        raise NaturalInvalid if numero == 1
        numero
    end
    rescue NaturalInvalid => e
        puts e.message
        puts "Debe ingresar números distintos de '1'. Intente nuevamente:"
        retry
end

# Y finalmente se imprime cada número dividido por su número entero inmediato anterior
resultado = numeros.map { | x| x / (x - 1)   }
puts 'El resultado es: %s' % resultado.join(', ')  