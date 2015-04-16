module BaseCRM
  module Middlewares
    class RaiseError < Faraday::Response::Middleware

      def on_complete(env)
        status = env[:status]
        return if (200...300).member?(status)

        content_type = env[:response_headers]['content-type']

        unless content_type.include?('json')
          raise "status=#{status} error=Unknown error occurred."
        end

        error_klass = case status
        when 422 then BaseCRM::ResourceError
        when 400...500 then BaseCRM::RequestError
        when 500...600 then BaseCRM::ServerError
        end

        raise errors_collection(env, error_klass)
      end

      def errors_collection(env, error_klass)
        envelope = JSON.parse(env[:body], symbolize_names: true)
        errors = envelope[:errors]
        ErrorsCollection.new(errors.map { |e| error_klass.new(e) }, envelope[:meta])
      end
    end
  end
end
