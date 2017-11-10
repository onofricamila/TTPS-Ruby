def expansor(string) 
    raise StandardError, "La entrada no es un string" unless string.is_a? String 
    raise StandardError, "El string es vacío" if string.length == 0 
    # con el string.to_i, "abc" == 0, "5abc" == 5 (separar el caso del 0)
    raise StandardError, "El formato del string es incorrecto" if string.to_i != 0 
    # si tiene solo alfa numericos (en realidad letras pq los numeros los checkeas arriba)
    raise StandardError, "El formato del string es incorrecto" if /\W/ === string 

    begin
        string.chars.map { |c| "#{c * get_code(c)}" }.join

        rescue ArgumentError 
            puts "Ingresaste el string 0!"
    end
end



# "A".ord => returns 65, the numeric code for "A", which is what the alphabet starts at.

# If you want it to start at 1 you could just subtract 64:

def get_code(c)
  c.upcase.ord - 'A'.ord + 1
end

# which works like:

# get_code('A') # 1
# get_code('B') # 2
# get_code('C') # 3

