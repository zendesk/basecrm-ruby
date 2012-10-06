module BaseCrm
  class Contact < ApiClient::Resource::Base

    include BaseCrm::Noteable

    namespace "contact"

    prefix    "api/v1"

    always do
      endpoint BaseCrm.config.endpoints.crm
    end

    def initialize(attributes)
      super
      simplify_custom_fields
    end

    def simplify_custom_fields
      fields = self['custom_fields'] || {} 
      self['custom_fields'] = fields.inject({}) do |memo, field|
        name, value = field
        memo[name] = value['value']
        memo
      end
    end

    def payload
      hash = super
      hash.delete('tags_joined_by_comma')
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

  end
end

