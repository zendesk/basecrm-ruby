require "bigdecimal"

module BaseCRM
  class Coercion
    def self.to_float_value(value)
      BigDecimal.new((value || 0), 15)
    end
  end
end
