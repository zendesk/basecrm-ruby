require "hashie/mash"

module BaseCrm

  def self.config
    @config ||= Hashie::Mash.new
  end

  self.config.token_name = "X-Pipejump-Auth"

  self.config.endpoints = {
    :app => "https://app.futuresimple.com",
    :core => "https://core.futuresimple.com",
    :crm => "https://crm.futuresimple.com",
    :sales => "https://sales.futuresimple.com",
    :leads => "https://leads.futuresimple.com",
    :common => "https://common.futuresimple.com"
  }

end

