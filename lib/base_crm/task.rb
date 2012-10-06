module BaseCrm
  class Task < ApiClient::Resource::Base

    namespace "task"

    prefix    "api/v1"

    always do
      endpoint BaseCrm.config.endpoints.common
    end

  end

end


