module BaseCrm
  class Note < ApiClient::Resource::Base

    namespace "note"

    prefix    "api/v1"

    always do
      endpoint BaseCrm.config.endpoints.common
    end

  end

end

