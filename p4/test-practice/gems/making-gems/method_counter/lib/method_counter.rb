class MethodCounter
    def self.hi
        puts "Hola, soy la gema :)"
    end
  module Countable
    # Para no tener que sobreescribir initialize
    def invocations
        # ||= devuelve invocations o le asigna y devuelve Hash.new(0)
        # La primera vez devuelve y asigna Hash.new(0), todas las siguientes veces devuelve la var
        @invocations ||= Hash.new(0)
    end

    module ClassMethods
        def count_invocations_of(*syms)
          syms.each do |sym| 
            alias_method(":original_#{sym}", sym) 
  
            define_method "#{sym}" do
              invocations[__method__] += 1
              send(":original_#{sym}")
            end
          end
        end
    end

    # Este metodo se ejecuta cuando se incluye el modulo.
    def self.included(base)
        # Extiendo la clase con los metodos del modulo ClassMethods.
        # Los metodos definidos en ClassMethods seran metodos de clase en la clase que lo incluye.
        base.extend(ClassMethods)
    end

    # Devuelve true si fue llamado.
    def invoked?(sym)
        invocations[sym] > 0
    end

    # Devuelve la cantidad de veces que el metodo fue llamado.
    def invoked(sym)
        invocations[sym]
    end
 end
end