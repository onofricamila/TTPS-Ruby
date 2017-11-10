# completa las epecificaciones del test para el metodo expansor

require 'minitest/autorun'
require 'minitest/spec'
require_relative 'p3TestingE13Methods.rb'

describe 'expansor' do
  # Casos de prueba con situaciones y/o entradas de datos esperadas
  describe 'Casos felices' do
    describe 'cuando la entrada es el string "a"' do
        it 'debe devolver "a"'do
            assert_equal("a", expansor("a"))
        end
    end

    describe 'cuando la entrada es el string "f"' do
        it 'debe devolver "ffffff"' do
            assert_equal("ffffff", expansor("f"))
        end
    end

    describe 'cuando la entrada es el string "escoba"' do
        it 'debe devolver "eeeeessssssssssssssssssscccooooooooooooooobba"' do
            assert_equal("eeeeessssssssssssssssssscccooooooooooooooobba", expansor("escoba"))
        end
    end
  end # del casos felices

  # Casos de pruebas sobre situaciones inesperadas y/o entradas de datos anómalas
  describe 'Casos tristes' do
    describe 'cuando la entrada no es un string' do
        it 'debe disparar una excepción estándar con el mensaje "La entrada no es un string"' do
            assert_raises(StandardError, "La entrada no es un string") do
                expansor(10)
            end
        end
    end

    describe 'cuando la entrada es el string vacío' do
        it 'debe disparar una excepción estándar con el mensaje "El string es vacío"' do
            assert_raises(StandardError, "El string es vacío") do
                expansor("")
            end
        end
    end

    describe 'cuando la entrada es el string "9"' do
        it 'debe disparar un excepción estándar con el mensaje "El formato del string es incorrecto"'do
            assert_raises(StandardError, "El formato del string es incorrecto") do
                expansor("9")
            end
        end
    end

    describe 'cuando la entrada es el string "*"' do
        it 'debe disparar una excepción estándar con el mensaje "El formato del string es incorrecto"' do
            assert_raises(StandardError, "El formato del string es incorrecto") do
                expansor("*")
            end
        end
    end 
  end # del casos tristes
end # del gral


# “Acceptable exception types maye be given as optional arguments.
# If the last argument is a String, it will be used as the error message.”

# los 'it' tambien van con do/end!!