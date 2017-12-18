class App
    def call(env)
        body = ['hola', 'holi', 'holu'].sample
        [ "200", { }, [body] ]
    end
end

run App.new