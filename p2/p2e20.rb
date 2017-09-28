# Hecho por seba, ver --> https://github.com/SebaRaimondi/TTPS-Ruby-Practicas/blob/master/Practica-02/P02E20.rb

# Un lazy enumemrator solo ejecuta lo que necesita para devolver el resultado.
# Si hago enumerator.collect { |x| x*x }.first(10) en un enumerator infinito,
# nunca termina la ejecucion.
# Si en cambio hago enumerator.lazy.collect { |x| x*x }.first(10),
# solo ejecuta lo necesario para devolver los primeros 10 resultados.

# --> It is an efficient way to get an arbitrary number of values 
# from a very large or infinite collection. 

# Iterator methods are eager by default. That means they process all collection items before returning anything.
# If we attempt to multiply the first ten items of an infinite array by 2.
# It does not work as it tries to multiply all (infinite) items first and then return the first ten items.
# It generates an infinite loop.

# LAZY METHOD --> haces enum.lazy.map{} ponele; va adelante del metodo normal
# By introducing the lazy method, we have created a lazy enumerator, which is an instance of the 
# Enumerator::Lazy class, introduced in Ruby 2.0. Lazy enumerators will only evaluate (process) the required amount of items to generate the desired output.
# EJEMPLO:

l = 1.upto(Float::INFINITY).lazy # Output: => #<Enumerator::Lazy: #<Enumerator: 1:upto(Infinity)>>
l.map { |x| x * 2 }.take(10).to_a # Output: => [2, 4, 6, 8, 10, 12, 14, 16, 18, 20]



# NOTA:
# visitar --> http://www.zenruby.info/2016/06/ruby-iterators-enumerators-enumerable.html 
# para comprender mejor los enumerators e iteradores

# If we create a custom class and include a custom method called each, we can use the Enumerable mixin to add extra collection-related functionality.
# The Enumerable mixin provides methods for sorting collection items and finding those with the highest or lowest values. All of them use the Comparable mixin and the <=> (spaceship) operator under the hood


# NOTAS NADA QUE VER:
# A los mwtodos map inject reduce podemos mandarle directamente el simbolo de un msj en vez de un bloque
# porque internamente haran un each con ese simbolo 