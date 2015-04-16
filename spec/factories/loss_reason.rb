FactoryGirl.define do
  factory :loss_reason, class: BaseCRM::LossReason do

    name { Faker::Name.name }


    to_create do |loss_reason|
      client.loss_reasons.create(loss_reason)
    end
  end
end
