# 13. Modificar el ej anterior para que GenericFactory sea mixin

module GenericFactory
    def create (**args)
        self.new(**args)
    end
    def initialize (**args)
        raise NotImplementedError
    end
end

class GenericFactoryExtender
    extend GenericFactory
    def initialize **args
    end
end

# Lo que hice fue poner al create como metodo de instancia del modulo (antes era un metodo de clase),
# y hacer un extend en la clase para que lo tome como metodo de clase