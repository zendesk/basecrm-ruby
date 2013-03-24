module BaseCrm
  class Contact < ApiClient::Resource::Base

    include BaseCrm::Resource
    include BaseCrm::Noteable
    include BaseCrm::Taskable

    namespace "contact"

    prefix    "api/v1"

    always do
      endpoint BaseCrm.config.endpoints.crm
    end

    def initialize(attributes, original_scope = nil)
      super
      simplify_custom_fields
    end

    def simplify_custom_fields
      fields = self['custom_fields'] || {} 
      self['custom_fields'] = fields.inject(Hashie::Mash.new) do |memo, field|
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

    def taskable_type
      "Contact"
    end

    private

    # Because custom fields are hashes, and hashes result in
    # new instances of BaseCrm::Contact, we end up with a stack level too deep
    # because simplify_custom_fields gets fired all the time
    def convert_value(val, duping=false) #:nodoc:
      if val.is_a?(Hash) or val.is_a?(::Hash)
        val
      else
        super
      end
    end
    
  end
end

