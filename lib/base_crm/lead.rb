module BaseCrm
  class Lead < ApiClient::Resource::Base

    include BaseCrm::Resource
    include BaseCrm::Noteable
    include BaseCrm::Taskable
    include BaseCrm::CustomFieldable

    namespace "lead"

    prefix    "api/v1"

    always do
      endpoint BaseCrm.config.endpoints.leads
    end

    def noteable_type
      "Lead"
    end

    def taskable_type
      "Lead"
    end

    def self.build(result_or_array)
      if result_or_array.has_key?('items')
        build_many(result_or_array['items'])
      else
        build_one(result_or_array)
      end
    end

  end
end


