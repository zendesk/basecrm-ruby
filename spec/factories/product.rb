FactoryGirl.define do
  factory :product, class: BaseCRM::Product do

    name { Faker::Name.name }
    description { "Includes more storage options" }
    sku { "enterprise-plan" }
    active { true }
    max_discount { 4 }
    max_markup { 4 }
    cost { 2 }
    cost_currency { "USD" }
    prices { [{"amount"=>"1599.99", "currency"=>"USD"}, {"amount"=>"3599.99", "currency"=>"PLN"}] }


    to_create do |product|
      client.products.create(product)
    end


  end
end
