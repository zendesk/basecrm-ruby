FactoryBot.define do
  factory :loss_reason, class: BaseCRM::LossReason do

    name { "loss_reason#{Time.now.to_i}" }


    to_create do |loss_reason|
      client.loss_reasons.create(loss_reason)
    end
  end
end
