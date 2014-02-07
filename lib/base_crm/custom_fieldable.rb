module BaseCrm
  def self.CustomFieldable(custom_fields_field_name)
    Module.new do
      def initialize(attributes, original_scope = nil)
        super
        simplify_custom_fields
      end

      define_method :simplify_custom_fields do
        fields = self[custom_fields_field_name] || {}
        self[custom_fields_field_name] = fields.inject(Hashie::Mash.new) do |memo, field|
          name, value = field
          memo[name] = value['value']
          memo
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
end
