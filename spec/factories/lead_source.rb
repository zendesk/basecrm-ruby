FactoryGirl.define do
  factory :lead_source, class: BaseCRM::LeadSource do

    name { Faker::Name.name }


    to_create do |lead_source|
      client.lead_sources.create(lead_source)
    end
  end
end
