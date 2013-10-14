require "delegate"
module BaseCrm

  class RelatedObjectScope < SimpleDelegator

    attr_accessor :object, :subobject, :type

    def initialize(object, subobject, key, type = nil)
      @object = object
      @subobject = subobject
      @type = type || object.class.name.split('::').last
      @type_key = "#{key}_type".to_sym
      @id_key = "#{key}_id".to_sym
      super(subobject_scope)
    end

    def subobject_scope
      @subobject_scope ||= object.pass_headers(subobject).params(type_and_id_scope)
    end

    def create(params)
      subobject_scope.create(type_and_id_scope.merge(params))
    end

    def type_and_id_scope
      {
        @type_key => type,
        @id_key => object.id
      }
    end

  end

end

