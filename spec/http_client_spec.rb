require 'spec_helper'

describe BaseCRM::HttpClient do
  describe 'Retries' do
    let(:statuses_to_retry) { [503] }
    let(:max_retry) { 3 }
    subject(:client_with_retry) { client_with_basic_retry(max_retry: max_retry, on_statuses: statuses_to_retry) }

    it "should pass retry statues to Faraday and do a valid request" do
      expect(client_with_retry.http_client.client.app.options.retry_statuses).to match_array(statuses_to_retry)
      expect(client_with_retry.http_client.client.app.options.max).to eq(max_retry)
      expect(client_with_retry.accounts.self).to be_instance_of BaseCRM::Account
    end
  end
end
