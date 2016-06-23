require "spec_helper"

describe BaseCRM::Coercion do
  describe "to_float" do
    it { expect(BaseCRM::Coercion.to_float_value(0)).to eql(0) }
    it { expect(BaseCRM::Coercion.to_float_value("0")).to eql(0) }
    it { expect(BaseCRM::Coercion.to_float_value(nil)).to eql(0) }
    it { expect(BaseCRM::Coercion.to_float_value(1.1)).to eql(BigDecimal.new("1.1", 15)) }
    it { expect(BaseCRM::Coercion.to_float_value("1.11")).to eql(BigDecimal.new("1.11", 15)) }
  end
end
