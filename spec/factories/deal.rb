FactoryBot.define do
  factory :deal, class: BaseCRM::Deal do

    currency { "EUR" }
    dropbox_email { "dropbox@4e627bcd.deals.futuresimple.com" }
    hot { true }
    name { Faker::Name.name }
    tags { ["important"] }
    value { 1000 }

    contact_id {  contact.id }

    to_create do |deal|
      client.deals.create(deal)
    end
  end
end
