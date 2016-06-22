require 'spec_helper'

describe BaseCRM::DealsService do
  describe 'Decimal deal values' do

    context 'with an integer value' do
      it 'returns an integer value' do
        deal = create(:deal)

        expect(client.deals.find(deal.id).value).to eql(deal.value)
      end

      it 'alows creation' do
        deal = build(:deal)

        expect(client.deals.create(deal).value).to eql(deal.value)
      end

      it 'alows update' do
        deal = create(:deal)
        new_value = 900
        deal.value = new_value

        expect(client.deals.update(deal).value).to eql(new_value)
      end
    end

    context 'with an decimal value' do
      it 'returns correct value' do
        deal = create(:deal_with_decimal_value)

        expect(client.deals.find(deal.id).value).to eql(BigDecimal.new(deal.value, 15))
      end

      it 'alows creation' do
        deal = build(:deal_with_decimal_value)

        allow_any_instance_of(BaseCRM::HttpClient).to receive(:request).and_return( [200 , {} , :data=> deal ] )

        expect(client.deals.create(deal).value).to eql(BigDecimal.new(deal.value, 15))
      end

      it 'alows update with a float' do
        deal = create(:deal_with_decimal_value)
        new_value = 900.45
        deal.value = new_value

        allow_any_instance_of(BaseCRM::HttpClient).to receive(:request).and_return( [200 , {} , :data=> deal ] )

        expect(client.deals.update(deal).value).to eql(BigDecimal.new(new_value, 15))
      end

      it 'alows update with a modified returned value' do
        deal = create(:deal_with_decimal_value)
        returned_deal = client.deals.find(deal.id)
        returned_deal.value = returned_deal.value + 17

        expect(client.deals.update(returned_deal).value).to eql(returned_deal.value)
      end
    end
  end
end
