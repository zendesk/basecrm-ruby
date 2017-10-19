FactoryGirl.define do
  factory :order, class: BaseCRM::Order do

    deal_id { 5 }
    discount { 4 }


    to_create do |order|
      client.orders.create(order)
    end
  end
end
