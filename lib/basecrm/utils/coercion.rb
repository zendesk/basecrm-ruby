require "bigdecimal"

module BaseCRM
  class Coercion
    def self.to_decimal_value(value)
      BigDecimal.new((value || 0), 15)
    end

    def self.to_string(value)
      case value
      when BigDecimal then value.to_s('F')
      else value.to_s
      end
    end
  end
end
