require 'sinatra'

$inventario = []
$inventario.push({'id' => $inventario.size, 'name' => 'P1', 'stock' => 5, 'price' => 5.5})
$inventario.push({'id' => $inventario.size, 'name' => 'P2', 'stock' => 5, 'price' => 5.5})
$inventario.push({'id' => $inventario.size, 'name' => 'P3', 'stock' => 5, 'price' => 5.5})

class App < Sinatra::Base
    get '/' do
        body 'App examen'
    end
    
    # JOIN: Returns a string created by converting each element of the array to a 
    # string, separated by the given separator
    get '/items' do
        $inventario.map{|p| p['name']}.join(', ')
    end
    
    # params{"ids"=>"0,1"}
    get '/items/:ids' do
        exist = params['ids'].split(',').map(&:to_i).select{|p| !$inventario[p].nil?}
        sum = exist.sum{|p| $inventario[p]['stock'] * $inventario[p]['price']}.to_s
        
        body 'La suma pesada es --> ' + sum
    end
    
    post '/items' do
        if !correct_params('name', 'stock', 'price')
            status 422
            body 'Faltan datos bb'
        else
            $inventario.push({'id' => $inventario.size,
                             'name' => params['name'],
                             'stock' => params['stock'].to_f,
                             'price' => params['price'].to_f
                            })
            status 201
            body 'Producto agregado'
        end
    end

    def correct_params(*args)
        args.map { |e| return false if params[e].nil? || params[e] == '' }
    end
    
end