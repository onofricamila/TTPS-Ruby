require 'sinatra'

$conjunto = []
$conjunto << {'palabra' => 'H', 'tries' => 2, 'guessed' => [] }
$conjunto << {'palabra' => 'C', 'tries' => 2, 'guessed' => [] }

class App < Sinatra::Base
    
    get '/' do
        redirect "/partida/" + rand($conjunto.size - 1).to_s
    end
    
    get '/partida/:id' do |id|
        if !$conjunto[params['id'].to_i].nil?
            res = $conjunto[params['id'].to_i].inspect
            body res
        else
            body 'no existe ese id bb'
        end
    end
    
    get '/partida/:id/try/:intento' do |id, intento|
        if !$conjunto[id.to_i].nil?
            if $conjunto[id.to_i]['tries'] > 0
                if $conjunto[id.to_i]['palabra'].include?(params['intento'])
                    $conjunto[id.to_i]['guessed'].push(params['intento'])  
                    if $conjunto[id.to_i]['guessed'].size == $conjunto[id.to_i]['palabra'].size
                        body 'Ganaste!'
                    end                 
                else
                    $conjunto[id.to_i]['tries']-=1
                end
                redirect "/partida/#{id}"
            else
                body 'no podes jugar mas, perdiste'
            end
        else
            body 'Ese id es trucho'
        end
    end
end