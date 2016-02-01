FactoryGirl.define do
  factory :source, class: BaseCRM::Source do

    name { Faker::Name.name }


    to_create do |source|
      client.sources.create(source, resource_type: source.resource_type)
    end

    factory :lead_source do
      resource_type 'lead'
    end

    factory :deal_source do
      resource_type 'deal'
    end
  end

end
