FactoryBot.define do
  factory :lead_source, class: BaseCRM::LeadSource do

    name { "source#{SecureRandom.hex}" }


    to_create do |lead_source|
      client.lead_sources.create(lead_source)
    end
  end
end
