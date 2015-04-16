module ClientHelpers
  def client
    @client ||= BaseCRM::Client.new(access_token: access_token)
  end

  def access_token
    @access_token ||= ENV.fetch("BASECRM_ACCESS_TOKEN") { raise '"BASECRM_ACCESS_TOKEN" has not been found.'  }
  end

  def contact
    @contact ||= FactoryGirl.create(:contact)
  end
end

RSpec.configure do |config|
  include ClientHelpers
end

FactoryGirl::SyntaxRunner.send(:include, ClientHelpers)
