require "spec_helper"

describe BaseCRM::Middlewares::RaiseError do
  before { @raise_error = BaseCRM::Middlewares::RaiseError.new }

  describe "on_complete" do

    it "return nil when code 200..300" do
      expect(@raise_error.on_complete({:status => 204})).to eql(nil)
    end

    it "raises ResourceError when code 422 and no content type" do
      expect { @raise_error.on_complete({:status => 422, :response_headers => {}}) }.to raise_error { |error|
                                                                                          expect(error).to be_a(BaseCRM::ResourceError)
                                                                                          expect(error.code).to eql(422)
                                                                                          expect(error.message).to eql("Unknown error occurred.")
                                                                                        }
    end

    it "raises RequestError when code 400..500 and no content type" do
      expect { @raise_error.on_complete({:status => 400, :response_headers => {}}) }.to raise_error { |error|
                                                                                          expect(error).to be_a(BaseCRM::RequestError)
                                                                                          expect(error.code).to eql(400)
                                                                                          expect(error.message).to eql("Unknown error occurred.")
                                                                                        }
    end

    it "raises ServerError when code 500..600 and no content type" do
      expect { @raise_error.on_complete({:status => 500, :response_headers => {}}) }.to raise_error { |error|
                                                                                          expect(error).to be_a(BaseCRM::ServerError)
                                                                                          expect(error.code).to eql(500)
                                                                                          expect(error.message).to eql("Unknown error occurred.")
                                                                                        }
    end

    it "raises ResourceError when code 422 and XML (not supported) content type" do
      expect { @raise_error.on_complete({:status => 422, :response_headers => {'content-type' => "application/xml"}}) }.to raise_error { |error|
                                                                                                                             expect(error).to be_a(BaseCRM::ResourceError)
                                                                                                                             expect(error.code).to eql(422)
                                                                                                                             expect(error.message).to eql("Unknown error occurred.")
                                                                                                                           }
    end
  end
end