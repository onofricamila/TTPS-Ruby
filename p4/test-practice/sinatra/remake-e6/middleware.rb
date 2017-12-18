class NumberToX 
    def initialize(app)
        @app = app
    end

    def call(env)
        status, headers, response  = @app.call(env)
        # haces un map porque la respuesta es un array con una sola pos
        # que tiene un string
        new_response = response.map { |word| word.gsub(/\d/,'x') }
        [status, headers, new_response]
    end
end