module BaseCrm
  class Contact < ApiClient::Resource::Base

    include BaseCrm::Resource
    include BaseCrm::Noteable
    include BaseCrm::Taskable
    include BaseCrm::CustomFieldable('custom_fields')

    namespace "contact"

    prefix    "api/v1"

    always do
      endpoint BaseCrm.config.endpoints.crm
    end

    def payload
      hash = super

      tags_joined_by_comma = hash.delete('tags_joined_by_comma')
      hash['tag_list'] ||= tags_joined_by_comma

      hash.delete('linkedin_display')

      hash
    end

    def self.fetch_for_deal(deal)
      scope.
        endpoint(BaseCrm.config.endpoints.sales).
        path("/api/v1/deals/#{deal.id}/contacts")
    end

    def noteable_type
      "Contact"
    end

    def taskable_type
      "Contact"
    end

  end
end

