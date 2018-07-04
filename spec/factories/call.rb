require 'securerandom'

FactoryGirl.define do
  factory :call, class: BaseCRM::Call do

    summary { "Schedule another call." }
    recording_url { "https://api.twilio.com/2010-04-01/Accounts/hAkjsahhd719e/Recordings/RKOHurusajda" }
    duration { 44 }
    phone_number { "+44-208-1234567" }
    incoming { true }
    missed { false }
    external_id { SecureRandom.hex(32) }
    made_at { "2014-09-27T16:32:56+00:00" }


    to_create do |call|
      client.calls.create(call)
    end
  end
end
