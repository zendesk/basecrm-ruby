require_relative 'middlewares/oauth_bearer_token'
require_relative 'middlewares/raise_error'

module BaseCRM
  class HttpClient

    attr_reader :headers

    def initialize(config)
      @config = config

      @headers = {
        'User-Agent' => config.user_agent,
        'Accept' => 'application/json'
      }

      @api_version = "/v2"

      options = {
        # timeout: config.timeout
      }
      options[:ssl] = { verify: false } unless config.verify_ssl

      @client = Faraday.new(config.base_url, options) do |faraday|
        faraday.use BaseCRM::Middlewares::OAuthBearerToken, config.access_token
        faraday.use BaseCRM::Middlewares::RaiseError
        faraday.response :logger, config.logger if config.debug?

        faraday.adapter Faraday.default_adapter
      end
    end

    def get(path, params={})
      request(:get, path, params)
    end

    def post(path, body={})
      request(:post, path, body)
    end

    def put(path, body={})
      request(:put, path, body)
    end

    def delete(path, params={})
      request(:delete, path, params)
    end

    def request(method, path, data={})
      options = {
        headers: @headers
      }

      case method.to_s.downcase.to_sym
      when :get, :head, :delete
        options[:query] = encode_params(data) unless data.empty?
      else
        unless data.empty?
          options[:headers]['Content-Type'] = 'application/json'
          options[:body] = Envelope.wrap(data)
        end
      end

      path = "#{@api_version}#{path}"

      res = instance_eval <<-RUBY, __FILE__, __LINE__ + 1
        @client.#{method}(path) do |req|
          req.body = options[:body] if options[:body]
          req.headers.update(options[:headers])
          req.params.update(options[:query]) if options[:query]
        end
      RUBY

      [res.status, res.headers, extract_body(res)]
    rescue Faraday::Error::ConnectionFailed => e
      raise ConnectionError, e.message
    end

  private
    def encode_params(params)
      params.map { |k, v|
        v.is_a?(Array) ? [k, v.join(',')] : [k, v]
      }.to_h
    end

    def extract_body(res)
      content_type = res.headers['Content-Type']
      content_type && content_type.include?('json') ? JSON.parse(res.body, symbolize_names: true) : res.body
    end
  end
end
