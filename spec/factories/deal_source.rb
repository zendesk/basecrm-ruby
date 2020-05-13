FactoryBot.define do
  factory :deal_source, class: BaseCRM::DealSource do

    name { "source#{SecureRandom.hex}" }


    to_create do |deal_source|
      client.deal_sources.create(deal_source)
    end
  end
end
