# Ejercicio hecho por seba, ver --> https://github.com/SebaRaimondi/TTPS-Ruby-Practicas/blob/master/Practica-02/P02E11.rb
# Considerar puso un modulo dentro de otro para separar entre los metodos que quiere que se tomen en 
# la clase que lo incluya como de instancia o como de clase. Se puede hacer eso.

# Modulo - Countable
# Aim: permitir hacer que cualquier clase cuente la cantidad de veces que los métodos de instancia definidos en ella son invocados

# First of all: A Mixin is basically just a Module that is included into a Class.
# When you “mixin” a Module into a Class, the Class will have access to the methods of the Module.
# Why you would want to use a Mixin?
# Mixins are perfect when you want to share functionality between different classes.
# Instead of repeating the same code over and over again, you can simple group the common functionality into a Module and then include it into each Class that requires it.
# OJO: Si el módulo está en otro fichero, hay que usar 'require'
# antes de usar el 'include' ponele.

module Countable
    # Para no tener que sobreescribir initialize
    def invocations
        # ||= devuelve invocations o le asigna y devuelve Hash.new(0)
        # La primera vez devuelve y asigna Hash.new(0), todas las siguientes veces devuelve la var
        @invocations ||= Hash.new(0)
    end

    module ClassMethods
        # Los siguientes metodos se incluiran como metodos de clase.
        def count_invocations_of(sym)
            # Creo una copia del metodo recibido como parametro. Su nombre sera el mismo con "o_" al principio.
            # Con esto puedo modificar el metodo original sin perder su funcionamiento.
            # El funcionamiento original queda en la copia que empieza con "o_".
            alias_method(:"o_#{sym}", sym)
 
            # Sobreescribo el original.
            define_method "#{sym}" do
                # Aumento la cantidad de veces que se llamo el metodo.
                # __method__ contiene el nombre del metodo en el que se ejecuta.
                invocations[__method__] += 1
                
                # Ejecuto la funcionalidad original del metodo.
                send(:"o_#{__method__}")
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

class Greeter
    # Incluyo el Mixin
    include Countable
    def hi
        puts 'Hey!'
    end
    def bye
        puts 'See you!'
    end
    # Indico que quiero llevar la cuenta de veces que se invoca el método #hi
    count_invocations_of :hi
end

# pruebo

# a = Greeter.new
# b = Greeter.new

# a.invoked? :hi
# => false

# b.invoked? :hi
# => false

# a.hi
# Imprime "Hey!"

# a.invoked :hi
# => 1

# b.invoked :hi
# => 0