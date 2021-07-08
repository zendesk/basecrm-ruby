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

    def get(path, params={}, headers={})
      request(:get, path, params, headers)
    end

    def post(path, body={}, headers={})
      request(:post, path, body, headers)
    end

    def put(path, body={}, headers={})
      request(:put, path, body, headers)
    end

    def delete(path, params={}, headers={})
      request(:delete, path, params)
    end

    def request(method, path, data={}, headers={})
      options = {
        headers: @headers.merge(headers.to_h)
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

      body = extract_body(res)
      @config.logger.debug body if @config.debug? && body && @config.logger
      [res.status, res.headers, body]
    rescue Faraday::ConnectionFailed => e
      raise ConnectionError, e.message
    end

  private
    def encode_params(params)
      Hash[params.map { |k, v|
        v.is_a?(Array) ? [k, v.join(',')] : [k, v]
      }]
    end

    def extract_body(res)
      content_type = res.headers['Content-Type']
      content_type && content_type.include?('json') ? JSON.parse(res.body, symbolize_names: true) : res.body
    end
  end
end
