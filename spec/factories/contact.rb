FactoryBot.define do
  factory :contact, class: BaseCRM::Contact do

    description { "I know him via Tom" }
    email { "mark#{SecureRandom.hex}@example.com" }
    facebook { "mjohnson" }
    fax { "+44-208-1234567" }
    first_name { Faker::Name.first_name }
    industry { "Design Services" }
    is_organization { false }
    last_name { Faker::Name.last_name }
    linkedin { "mjohnson" }
    mobile { "508-778-6516" }
    name { Faker::Name.name }
    phone { "508-778-6516" }
    skype { "mjohnson" }
    tags { ["important"] }
    title { "CEO" }
    twitter { "mjohnson" }
    website { "www.example.com" }


    to_create do |contact|
      client.contacts.create(contact)
    end
  end
end
