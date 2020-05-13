FactoryBot.define do
  factory :source, class: BaseCRM::Source do

    name { "source#{SecureRandom.hex}" }


    to_create do |source|
      client.sources.create(source)
    end
  end
end
