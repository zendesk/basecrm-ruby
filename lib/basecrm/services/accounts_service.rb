# WARNING: This code is auto-generated from the BaseCRM API Discovery JSON Schema

module BaseCRM
  class AccountsService
    def initialize(client)
      @client = client
    end
  
    # Retrieve account details
    # 
    # get '/accounts/self'
    #
    # Returns detailed information about your account
    #
    # @return [Account] Resource object. 
    def self
      _, _, root = @client.get("/accounts/self")
      Account.new(root[:data])
    end


  private
    def validate_type!(account)
      raise TypeError unless account.is_a?(Account) || account.is_a?(Hash)
    end

    def extract_params!(account, *args)
      params = account.to_h.select{ |k, _| args.include?(k) }
      raise ArgumentError, "one of required attributes is missing. Expected: #{args.join(',')}" if params.count != args.length
      params
    end
  end
end
