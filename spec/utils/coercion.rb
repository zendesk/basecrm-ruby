require "spec_helper"

describe BaseCRM::Coercion do
  describe "to_decimal" do
    it { expect(BaseCRM::Coercion.to_decimal_value(0)).to eql(0) }
    it { expect(BaseCRM::Coercion.to_decimal_value("0")).to eql(0) }
    it { expect(BaseCRM::Coercion.to_decimal_value(nil)).to eql(0) }
    it { expect(BaseCRM::Coercion.to_decimal_value(1.1)).to eql(BigDecimal("1.1", 15)) }
    it { expect(BaseCRM::Coercion.to_decimal_value("1.11")).to eql(BigDecimal("1.11", 15)) }
  end
end
