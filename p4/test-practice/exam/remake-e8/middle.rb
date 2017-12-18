class Middleware
    def initialize(app)
        @app = app
    end

    def call(env)
        if env['PATH_INFO'] == '/_healthcheck'
            [200, {}, ['Todo ok']]
        else
            @app.call(env)
        end
    end
end