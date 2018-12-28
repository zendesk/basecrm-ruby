FactoryBot.define do
  factory :source, class: BaseCRM::Source do

    name { Faker::Name.name }


    to_create do |source|
      client.sources.create(source)
    end
  end
end
