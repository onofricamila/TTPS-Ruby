require 'sinatra'
require_relative 'middleware.rb'

class App < Sinatra::Base

    use NumberToX

    get '/' do
        body 'Bienvenido a mi app <3'
    end

    get '/mcm/:a/:b' do
       params['a'].to_i.lcm(params['b'].to_i).to_s
    end

    # con splat asumis los params vienen separados por /. Params en splat es
    # un array de un string del tipo "58/100". Lo convertis a ["58", "100"], obtenes
    # [58, 100]
    get '/sum/*' do
       sum = params['splat'][0].split('/').sum{ |each| each.to_i}.to_s
       body = ("La suma de los numeros en la url es igual a " + sum)
    end

    get '/even/*' do
        cant = params['splat'][0].split('/').select{ |each| each.to_i.even?}.size.to_s
        body ('La cantidad de numeros pares en la url es: ' + cant)
    end

    # lo probas haciendo curl -X POST http://localhost:9292/random
    post '/random' do
        body 'N° random: ' + rand(1..100).to_s
    end

    # probarlo haciendo  curl -X POST http://localhost:9292/random/1/5
    post '/random/:lower/:upper' do
        lower = params['lower'].to_i
        upper = params['upper'].to_i
        body 'N° random: ' + rand(lower..upper).to_s
    end
end