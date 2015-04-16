FactoryGirl.define do
  factory :lead, class: BaseCRM::Lead do

    description { "I know him via Tom" }
    email { "mark@designservices.com" }
    facebook { "mjohnson" }
    fax { "+44-208-1234567" }
    first_name { Faker::Name.first_name }
    industry { "Design Services" }
    last_name { Faker::Name.last_name }
    linkedin { "mjohnson" }
    mobile { "508-778-6516" }
    phone { "508-778-6516" }
    skype { "mjohnson" }
    status { "Unqualified" }
    tags { ["important"] }
    title { "CEO" }
    twitter { "mjohnson" }
    website { "www.designservices.com" }


    to_create do |lead|
      client.leads.create(lead)
    end
  end
end
