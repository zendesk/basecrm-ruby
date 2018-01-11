require "spec_helper"

describe BaseCRM::Middlewares::RaiseError do

  describe "on_complete 200..300" do
    raise_error = BaseCRM::Middlewares::RaiseError.new
    it { expect( raise_error.on_complete({:status => 204})).to eql(nil) }
  end

  describe "on_complete 400 without content type" do
    raise_error = BaseCRM::Middlewares::RaiseError.new
    it { expect( raise_error.on_complete({:status => 400, :response_headers=>{}})).to raise_error(BaseCRM::RequestError) }
  end
end