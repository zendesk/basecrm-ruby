FactoryGirl.define do
  factory :note, class: BaseCRM::Note do

    content { "Highly important." }

    resource_id  { contact.id }
    resource_type { :contact }

    to_create do |note|
      client.notes.create(note)
    end
  end
end
