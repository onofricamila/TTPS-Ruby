class XCount

    def initialize(app)
        @app = app
    end

    def call(env)
        status, headers, response  = @app.call(env)
        # los headers son un hash con key -> nombre  value -> valor
        # haces el array response to_s
        headers['X-Xs-Count'] = response.to_s.count('x').to_s
        [status, headers, response]
    end
end