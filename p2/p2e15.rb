# 15. Analiza el siguiente scrip y responde las preguntas debajo.

VALUE = 'global'
module A
	VALUE = 'A'
	class B
		VALUE = 'B'
		def self.value
			VALUE
		end

		def value
			'iB'
		end

	end

	def self.value
		VALUE
	end

end

class C
	class D
		VALUE = 'D'
		def self.value
			VALUE
		end

	end

	module E
		def self.value
			VALUE
		end

	end

	def self.value
		VALUE
	end

end

class F < C
	VALUE = 'F'
end

p "1. ¿Qué imprimen cada una de las siguientes sentencias? ¿De dónde está obteniendo
el valor?"
p "1. puts A.value --> #{A.value}" #A --> es la var local al modulo A
p "2. puts A::B.value --> #{A::B.value}" #B --> estoy accediendo a la var value de la clase B del modulo A. Se acceden las clases como si fueran constantes
p "3. puts C::D.value --> #{C::D.value}" #D --> accedo a la clase D dentro de la clase C
p "4. puts C::E.value --> #{C::E.value}" #global --> accedo al modulo E dentro de C y no hay ninguna var value local ...tomo la de arriba! 
p "5. puts F.value --> #{F.value}" #global --> como F hereda de C puede entender el msj de clase value y devuelve global por mas que yo pensaba devolvia F. Ni idea

p "2. ¿Qué pasaría si ejecutases las siguientes sentencias? ¿Por qué?"
p "1. puts A::value --> #{A::value}" #A --> tipo accedo directo a la var
p "2. puts A.new.value --> undefined method `new' for A:Module" # no se puede instanciar un modulo
p "3. puts B.value --> uninitialized constant B" # B está fuera del alcance, debido a que está definido dentro del módulo A
p "4. puts C::D.value --> #{C::D.value}" #D
p "5. puts C.value --> #{C.value}" #global --> es un msj de clase y tipo como no tiene var local accede a la de afuera
p "6. puts F.superclass.value --> #{F.superclass.value}" #global --> no entiendo por que no imprime F
