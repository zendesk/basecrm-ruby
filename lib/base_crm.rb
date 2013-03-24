require "api_client"
require "base_crm/version"
require "base_crm/config"
require "base_crm/api_client_ext"

module BaseCrm

  autoload :Account,         "base_crm/account"
  autoload :Contact,         "base_crm/contact"
  autoload :Session,         "base_crm/session"
  autoload :Deal,            "base_crm/deal"
  autoload :Source,          "base_crm/source"
  autoload :Resource,        "base_crm/resource"
  autoload :Note,            "base_crm/note"
  autoload :Noteable,        "base_crm/noteable"
  autoload :Task,            "base_crm/task"
  autoload :Taskable,        "base_crm/taskable"
  autoload :Lead,            "base_crm/lead"
  autoload :CustomFieldable, "base_crm/custom_fieldable"

end

