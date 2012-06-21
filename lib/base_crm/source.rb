module BaseCrm
  class Source < ApiClient::Resource::Base

    namespace "source"

    prefix    "api/v1"

    always do
      endpoint "https://sales.futuresimple.com"
    end

  end
end

