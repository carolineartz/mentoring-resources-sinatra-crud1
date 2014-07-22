# Disable the default logging
module Rack
  class CommonLogger
    def call(env)
      # do nothing
      @app.call(env)
    end
  end
end


class TerseParamsLogger
  def initialize(app)
    @app = app
  end

  def call(env)
    if env['REQUEST_PATH'] && !(env['REQUEST_PATH'].match /(js|css|ico|jpg|png|jpeg)$/)
      post_params = Rack::Utils.parse_query(env['rack.input'].read, "&")
      query_params  = Rack::Utils.parse_query(env['QUERY_STRING'],    "&")

      puts "#{env['REQUEST_METHOD']} #{env['REQUEST_URI']}"
      puts "  Query params: #{query_params.inspect}"
      puts "  Requst body params: #{post_params.inspect}"
      puts "\n"
    end

    @app.call(env)
  end
end
