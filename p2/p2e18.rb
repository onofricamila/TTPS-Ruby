# Hecho por pedro, ver --> https://github.com/pedrobrost/Facultad_Informatica_UNLP/blob/master/Ruby/practica2.md#4-implement%C3%A1-el-mixin-countable-que-te-permita-hacer-que-cualquier-clase-cuente-la-cantidad-de-veces-que-los-m%C3%A9todos-de-instancia-definidos-en-ella-es-invocado-utilizalo-en-distintas-clases-tanto-desarrolladas-por-vos-como-clases-de-la-librer%C3%ADa-standard-de-ruby-y-cheque%C3%A1-los-resultados-el-mixin-debe-tener-los-siguientes-m%C3%A9todos
# 18. Manejo de excepciones.

def met *args                                                                              
    begin                                                                                  
        yield args                                                                         
    rescue RuntimeError                                                                    
        puts "Algo salió mal"                                                              
        :rt                                                                                
    rescue NoMethodError => e                                                              
        puts "No encontré un método: #{e.message}"                                         
        :nm                                                                                
    rescue                                                                                 
        puts "No se que hacer"                                                             
        raise                                                                              
    else                                                                                   
        :ok                                                                                
    end                                                                                    
end