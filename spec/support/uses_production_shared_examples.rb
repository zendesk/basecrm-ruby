shared_examples "uses production" do
  describe "endpoint" do
    let(:endpoint) { described_class.scope.instance_eval { @endpoint } }

    it "uses the production endpoint" do
      expect(endpoint).to eq(production_endpoint_url)
    end
  end
end
