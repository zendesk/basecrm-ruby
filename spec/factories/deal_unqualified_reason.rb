FactoryBot.define do
  factory :deal_unqualified_reason, class: BaseCRM::DealUnqualifiedReason do

    name { "unqualified_reason#{SecureRandom.hex}" }


    to_create do |deal_unqualified_reason|
      client.deal_unqualified_reasons.create(deal_unqualified_reason)
    end
  end
end
