module BaseCRM
  class PaginatedResource
    include Enumerable

    attr_reader :current_page

    def initialize(service, *args)
      raise TypeError unless service.respond_to?(:where)

      @service = service
      @args = args
      @options = args.last.kind_of?(Hash) ? args.pop : {}
    end

    def each(&block)
      return to_enum(:each) unless block_given?

      current_page = 1
      per_page = 25

      search_options = @options.merge(page: current_page, per_page: per_page)

      until (resources = @service.where(*@args, search_options)).empty?
        resources.each(&block)
        current_page += 1
        search_options[:page] = current_page
      end

      self
    end
  end
end
