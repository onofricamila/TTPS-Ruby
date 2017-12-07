class PoliteController < ApplicationController
  
  # cuando hacemos http://localhost:3000/polite/salute vemos un saludo random
  def salute
    @hi = ['Hola', 'Holii', 'Holu'].shuffle.first
  end
end
