FactoryGirl.define do
  factory :line_item, class: BaseCRM::LineItem do
    # transient attributes, required in url
    order_id nil

    product_id { 5 }
    value { 1599.99 }
    variation { 0 }
    currency { "USD" }
    quantity { 1 }
    price { 1599.99 }


    to_create do |line_item|
      client.line_items.create(line_item.order_id, line_item)
    end
  end
end
