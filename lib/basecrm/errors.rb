module BaseCRM
  class ConnectionError < StandardError
  end

  class ConfigurationError < StandardError
  end

  class BaseError < StandardError
    attr_reader :code, :message, :details

    def initialize(error)
      @data = error[:error]
      @meta = error[:meta]

      @code = @data[:code]
      @message = @data[:message]
      @details = @data[:details]
    end

    def to_s
      "code=#{@code} message=#{message} details=#{details}"
    end
  end

  class RequestError < BaseError
  end

  class ResourceError < BaseError
    attr_reader :resource, :field

    def initialize(error)
      super

      @resource = @data[:resource]
      @field = @data[:field]
    end

    def to_s
      super + " resource=#{@resource} field=#{@field}"
    end
  end

  class ServerError < BaseError
  end

  class ErrorsCollection < StandardError
    attr_reader :errors

    attr_reader :http_status, :logref
    alias_method :request_id, :logref


    def initialize(errors, meta)
      @errors = errors

      @http_status = meta[:http_status]
      @logref = meta[:logref]
    end

    def to_s
      status = "[#{@logref}] http_status=#{@http_status}\n"
      status + @errors.map(&:to_s).join("\n")
    end
  end
end
