require "bigdecimal"
require "spec_helper"

describe BaseCRM::Coercion do
  describe "to_decimal" do
    it { expect(BaseCRM::Coercion.to_decimal_value(0)).to eql(0) }
    it { expect(BaseCRM::Coercion.to_decimal_value("0")).to eql(0) }
    it { expect(BaseCRM::Coercion.to_decimal_value(nil)).to eql(0) }
    it { expect(BaseCRM::Coercion.to_decimal_value(1.1)).to eql(BigDecimal("1.1", 15)) }
    it { expect(BaseCRM::Coercion.to_decimal_value("1.11")).to eql(BigDecimal("1.11", 15)) }
  end

  describe "to_string" do
    it { expect(BaseCRM::Coercion.to_string(1)).to eql("1") }
    it { expect(BaseCRM::Coercion.to_string("1")).to eql("1") }
    it { expect(BaseCRM::Coercion.to_string(1.11)).to eql("1.11") }
    it { expect(BaseCRM::Coercion.to_string("1.11")).to eql("1.11") }
    it { expect(BaseCRM::Coercion.to_string(BigDecimal("1.11"))).to eql("1.11") }
    it { expect(BaseCRM::Coercion.to_string(BigDecimal(1.11, 15))).to eql("1.11") }
  end
end
