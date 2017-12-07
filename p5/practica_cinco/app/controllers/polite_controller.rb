class PoliteController < ApplicationController
  
  # cuando hacemos http://localhost:3000/polite/salute vemos un saludo random
  def salute
    @hi = ['hello_sir', 'hello_madam', 'hi'].shuffle.first
  end
end
