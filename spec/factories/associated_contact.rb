FactoryGirl.define do
  factory :associated_contact, class: BaseCRM::AssociatedContact do
    # transient attributes, required in url
    deal_id nil

    role { "involved" }

    contact_id {  contact.id }

    to_create do |associated_contact|
      client.associated_contacts.create(associated_contact.deal_id, associated_contact)
    end
  end
end
