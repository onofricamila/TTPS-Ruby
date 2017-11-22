# se ejecuta haciendo desde consola ruby mol.rb

require 'rack'
class Mol
    def call(env)
        num = rand(1..42)
        code = num == 42 ? 200 : 404
        [ code, { "Content-Type" => "text/plain" }, [num.to_s] ]
    end
end
  
Rack::Handler::WEBrick.run(Mol.new, :Port => 9292)
  