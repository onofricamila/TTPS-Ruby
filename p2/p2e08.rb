#   Código hecho por seba, ver --> https://github.com/SebaRaimondi/TTPS-Ruby-Practicas/blob/master/Practica-02/P02E08.rb
#   Clases y módulos - Vehiculos

class Taller
    def probar objeto
        objeto.arrancar
    end
end

class Vehiculo
	def initialize
		@llave = false
	end
	def llave
		@llave = !@llave
	end
	def arrancar
		if @llave
			puts "El vehiculo arranco"
		else
			puts "El vehiculo no tiene puesta la llave"
		end
	end
end

class Auto < Vehiculo
	def initialize
		@frenoDeMano = true
		@puntoMuerto = true
	end
	def frenoDeMano
		@frenoDeMano = !@frenoDeMano
	end
	def puntoMuerto
		@puntoMuerto = !@puntoMuerto
	end
	def arrancar
		return super if !@frenoDeMano && @puntoMuerto
		puts "El auto tiene puesto el freno de mano o no esta en punto muerto"
	end
end

class Moto < Vehiculo
	def initialize
		@patada = false
	end	
	def patada
		@patada = !@patada
	end
	def arrancar
		return super if @patada
		puts "La moto no arranco porque no le diste una patada"
	end
end

class Lancha < Vehiculo
	
end

# Si queremos probar una motosierra en el taller podriamos hacerlo tranquilamente siempre y cuando
# esta entienda el mensaje "arrancar". Hacemos uso de polimorfismo, y en el caso de los vehiculos,
# usamos herencia permitinedo las diferentes especializaciones

# Nota:
# .las vi se crean la primera vez que son nombradas
# .checkear similitud en sintaxis en cuanto al uso del return y break condicional