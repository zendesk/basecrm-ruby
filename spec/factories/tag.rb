FactoryBot.define do
  factory :tag, class: BaseCRM::Tag do

    name { Faker::Name.name }

    resource_type { :contact }

    to_create do |tag|
      client.tags.create(tag)
    end
  end
end
