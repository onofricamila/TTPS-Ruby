# 19. Hacer fibbonacci usando Enumerator

fibonacci = Enumerator.new do |caller|
    i1, i2 = 1, 1
    loop do
      caller.yield i1
      i1, i2 = i2, i1+i2
    end
  end

  puts "- Pido los primeros 10 numeros de la secuencia --> #{fibonacci.first(10)}"
  puts "- Pido el último de los 10 numeros: #{fibonacci.first(10).last}" 

  # NOTA:
  # El método loop 
  #     - Ejecuta el código que se encuentra dentro del bloque
  #     - Se puede salir con break cuando se cumple una condición
  #     - Si hay iteradores, loop terminará cuando el Enumerator se quede sin valores
