# Vamos a testear el correcto funcionamiento del metodo en_palabras, que traduce la hora a texto
# Supongo tendria que hacer los casos tristes de que si no mando el dato esperado se levante una excepcion
# pero tendria que cambiar los metodos originales y ni 

require 'minitest/autorun'
require 'minitest/spec'
require_relative 'p3TestingE11Methods.rb'

# PRACTICA 1

describe '#contar' do

    describe 'casos felices' do

      describe 'cuando la entrada es el string "La casa de la abuela" y el substring "la"' do
        it 'debe devolver 3'do
            assert_equal(3, contar("La casa de la abuela", "la"))
        end
      end

      describe 'cuando la entrada es el string "La casa de LA ABUELA" y el substring "la"' do
        it 'debe devolver 3, por ser case insensitive'do
            assert_equal(3, contar("La casa de la abuela", "la"))
        end
      end

      describe 'cuando la entrada es el string "La casa de la abuela" y el substring "lala"' do
        it 'debe devolver 0'do
            assert_equal(0, contar("La casa de la abuela", "lala"))
        end
      end
    
    end # casos felices contar

end # gral contar

describe '#strLengthArray' do
  
      describe 'casos felices' do

        describe 'cuando la entrada ["", "alo", "hi"]' do
          it 'debe devolver [0, 3, 2]'do
              assert_equal([0, 3, 2], strLengthArray(["", "alo", "hi"]))
          end
        end

        describe 'cuando la entrada []' do
          it 'debe devolver []'do
              assert_equal([], strLengthArray([]))
          end
        end
      
      end # casos felices strLengthArray
  
  end # gral strLengthArray

  # PRACTICA 2

  describe '#ordenar_arreglo' do
    
        describe 'casos felices' do
  
          describe 'cuando la entrada [10,1,5,8]' do
            it 'debe devolver [1,5,8,10]'do
                assert_equal([1,5,8,10], ordenar_arreglo([10,1,5,8]))
            end
          end
  
          describe 'cuando la entrada []' do
            it 'debe devolver []'do
                assert_equal([], ordenar_arreglo([]))
            end
          end
        
        end # casos felices ordenar_arreglo
    
    end # gral ordenar_arreglo
  
    describe '#da_nil?' do
      
          describe 'casos felices' do
    
            describe 'cuando la entrada {5 + 10}' do
              it 'debe devolver false'do
                  assert_equal(false, da_nil?{5 + 10})
              end
            end
    
            describe 'cuando la entrada {}' do
              it 'debe devolver true'do
                  assert_equal(true, da_nil?{})
              end
            end
          
          end # casos felices da_nil?
      
      end # gral da_nil?