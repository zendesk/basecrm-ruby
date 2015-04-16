require 'uri'

module BaseCRM
  class Configuration
    attr_reader :access_token
    attr_reader :base_url
    attr_reader :user_agent
    attr_reader :timeout
    attr_reader :verify_ssl

    attr_reader :logger, :verbose
    alias_method :debug?, :verbose

    def initialize(options={})
      @access_token = options[:access_token]
      @base_url = options[:base_url] || "https://api.getbase.com"
      @user_agent = options[:user_agent] || "BaseCRM/v2 Ruby/#{VERSION}"
      @logger = options[:logger]
      @verbose = !!options[:verbose]
      @timeout = options[:timeout] || 30
      @verify_ssl = options.fetch(:verify_ssl, true)
    end

    def validate!
      unless @access_token
        raise ConfigurationError.new('No access token provided. '\
          'Set your access token during client initialization using: '\
          '"Base::Client.new(access_token: <YOUR_PERSONAL_ACCESS_TOKEN>)".')
      end

      if @access_token =~ /\s/
        raise ConfigurationError.new('Provided access token is invalid '\
          'as it contains disallowed characters. '\
          'Please double-check your access token.')
      end

      if @access_token.length != 64
        raise ConfigurationError.new('Provided access token is invalid '\
          'as it has invalid length. '\
          'Please double-check your access token.')

      end

      unless /\A#{URI.regexp(%w(http https)).to_s}\z/.match(@base_url)
        raise ConfigurationError.new('Provided base url is invalid '\
          'as it is not a valid URI. '\
          'Please make sure it includes the scheme part, both http and https are accepted, '\
          'and the hierarchical part.')
      end

    end

    def inspect
      instance_variables.map { |ivar|
        "#{ivar}=#{self.instance_variable_get(ivar)}"
      }.join("\n")
    end
  end
end
