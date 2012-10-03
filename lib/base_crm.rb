require "api_client"
require "base_crm/version"
require "base_crm/config"

module BaseCrm

  autoload :Account, "base_crm/account"
  autoload :Contact, "base_crm/contact"
  autoload :Session, "base_crm/session"
  autoload :Deal,    "base_crm/deal"
  autoload :Source,  "base_crm/source"

end

