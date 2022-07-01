module ClientHelpers
  def client
    @client ||= BaseCRM::Client.new(access_token: access_token, base_url: base_url)
  end

  def client_with_basic_retry(max_retry: 1, on_statuses: [])
    @client_with_basic_retry ||= BaseCRM::Client.new(access_token: access_token, base_url: base_url, max_retry: max_retry, retry_statuses: on_statuses)
  end

  def access_token
    @access_token ||= ENV.fetch("BASECRM_ACCESS_TOKEN") { raise '"BASECRM_ACCESS_TOKEN" has not been found.'  }
  end

  def base_url
    @basecrm_url ||= ENV.fetch("BASECRM_BASE_URL") { "https://api.getbase.com" }
  end

  def contact
    @contact ||= FactoryBot.create(:contact)
  end
end

RSpec.configure do |config|
  include ClientHelpers
end

FactoryBot::SyntaxRunner.send(:include, ClientHelpers)
