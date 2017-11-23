require 'sinatra'
require_relative 'amount_of_x.rb'
require_relative 'number_to_x.rb'

class App < Sinatra::Base

    # asi indico que voy a usar el middleware. Se ejecutan segun orden del use
    use AmountOfX
    use NumberToX

    # generico
    get '/' do
    "Hello, World!"
    end

    # para urls con datos

    # <int>.lcm(<int2>) --> returns the least common multiple (always positive)
    get '/mcm/:a/:b' do |a, b|
        a.to_i.lcm(b.to_i).to_s
    end

    # <int>.gcd(<int2>) --> returns the greatest common divisor (always positive)
    get '/mcd/:a/:b' do |a, b|
        a.to_i.gcd(b.to_i).to_s
    end

    # /* lo toma como un array con elem/elem2/ ..
    # map {|elem| elem.to_i} == map (&:to_i)
    get '/sum/*' do |nums|
        nums.split('/').map {|elem| elem.to_i}.sum.to_s
    end

    get '/even/*' do |nums|
        nums.split('/').map(&:to_i).select(&:even?).size.to_s
    end

    # lo probas haciendo en la terminal:  curl -X POST http://localhost:9292/random 
    # rand te da un n° random por lo general 0.x
    post '/random' do
        rand.to_s
    end

    # lo probas haciendo en la terminal:  curl -d "" -X POST http://localhost:9292/random/1/10
    # si no envias esa data vacia hay un error no se que onda
    # rand 1..10 te da un n° del 1 al 10
    post '/random/:lower/:upper' do |lower, upper|
        rand(lower.to_i..upper.to_i).to_s
    end

end

# NOTA SUPER IMPORTANTE
# - Ver como se toman los datos pasados por url
# - Pasar los params por url a integer antes de usarlos, con to_i
# - Pasar el res numerico a string con to_s si es numerico, sino sale error: Internal Server Error
#   undefined method `bad_request?' for #<Rack::ShowExceptions:0x005650f2f353d8> 