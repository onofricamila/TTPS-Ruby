# se ejecuta haciendo desde consola rackup

class Mol
    def call(env)
        num = rand(1..42)
        code = num == 42 ? 200 : 404
        [ code, { "Content-Type" => "text/plain" }, [num.to_s] ]
    end
end
  
run Mol.new