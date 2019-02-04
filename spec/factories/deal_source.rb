FactoryBot.define do
  factory :deal_source, class: BaseCRM::DealSource do

    name { Faker::Name.name }


    to_create do |deal_source|
      client.deal_sources.create(deal_source)
    end
  end
end
