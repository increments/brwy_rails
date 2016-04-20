module BrwyRails
  class Middleware
    def initialize(app)
      @app = app
    end
    def call(env)
      req = Rack::Request.new env
      @app.call(env)
    end
  end
end
