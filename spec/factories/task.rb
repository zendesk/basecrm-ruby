FactoryGirl.define do
  factory :task, class: BaseCRM::Task do

    content { "Contact Tom" }
    due_date { "2014-09-27T16:32:56+00:00" }
    remind_at { "2014-09-29T15:32:56+00:00" }

    resource_id  { contact.id }
    resource_type { :contact }

    to_create do |task|
      client.tasks.create(task)
    end
  end
end
