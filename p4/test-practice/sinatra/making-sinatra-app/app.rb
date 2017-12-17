require 'sinatra'
class App < Sinatra::Base
    
    get '/' do
        body ['hola']
    end
    
end