require 'sinatra'

class App < Sinatra::Base

    # generico
    get '/' do
    "Hello, World!"
    end

    # para urls con datos
    get '/mcm/:a/:b' do |a, b|
        a.to_i.lcm(b.to_i).to_s
    end

    get '/mcd/:a/:b' do |a, b|
        a.to_i.gcd(b.to_i).to_s
    end

    get '/sum/*' do |nums|
        nums.split('/').map(&:to_i).sum.to_s
    end

    get '/even/*' do |nums|
        nums.split('/').map(&:to_i).select(&:even?).size.to_s
    end

    # lo probas haciendo en la terminal:  curl -X POST http://localhost:9292/random 
    post '/random' do
        rand.to_s
    end

    # lo probas haciendo en la terminal:  curl -d "" -X POST http://localhost:9292/random/1/10
    # si no envias esa data vacia hay un error no se que onda
    post '/random/:lower/:upper' do |lower, upper|
        rand(lower.to_i..upper.to_i).to_s
    end

end