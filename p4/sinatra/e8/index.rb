require 'sinatra'
require_relative 'partida.rb'

class Index < Sinatra::Base
  
  list = [Partida.new('hola'), Partida.new('chau'), Partida.new('test')]
  
  post '/' do
    redirect "/partida/#{rand(list.size)}"
  end
  
  get '/partida/:id' do |id|
    list[id.to_i].summary
  end
  
  # probas haciendo $ curl -v -X PUT  -F "intento=b" "http://localhost:9292/partida/0"
  # y tipo ahi  abris el enlace que te muestra en consola o refresacas el navegador
  put '/partida/:id' do |id|
    list[id.to_i].try(params['intento'])
    redirect "/partida/#{id}"
  end
  
end