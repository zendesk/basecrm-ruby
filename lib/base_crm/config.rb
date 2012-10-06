require "hashie/mash"

module BaseCrm

  def self.config
    @config ||= Hashie::Mash.new
  end

  self.config.token_name = "X-Pipejump-Auth"

  self.config.endpoints = {
    :core => "https://core.futuresimple.com",
    :crm => "https://crm.futuresimple.com",
    :sales => "https://sales.futuresimple.com",
    :common => "https://common.futuresimple.com"
  }

end

