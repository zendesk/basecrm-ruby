module BaseCRM
  module Middlewares
    class OAuthBearerToken < Faraday::Middleware

      def initialize(app, access_token)
        super app
        @access_token = access_token
      end


      def call(env)
        env[:request_headers]["Authorization"] = "Bearer #{@access_token}"
        @app.call(env)
      end

    end
  end
end
