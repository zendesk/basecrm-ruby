module BaseCrm
  class Lead < ApiClient::Resource::Base

    include BaseCrm::Resource
    include BaseCrm::Noteable
    include BaseCrm::Taskable

    namespace "lead"

    prefix    "api/v1"

    always do
      endpoint BaseCrm.config.endpoints.leads
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


