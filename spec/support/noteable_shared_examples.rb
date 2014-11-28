shared_examples "noteable" do |noteable_type|

  let(:scope) { double }

  describe "#notes" do
    let(:fetch_scope) { double }

    it "passes the token and applies the params" do
      expect(subject).to receive(:pass_headers)
        .with(BaseCrm::Note)
        .and_return(scope)

      expect(scope).to receive(:params)
        .with({
          :noteable_type => noteable_type,
          :noteable_id => subject.id
        }).and_return(fetch_scope)

      expect(subject.notes).to eq(fetch_scope)
    end

  end

  describe "#notes.create" do
    let(:message) { double }
    let(:note) { double }
    let(:fetch_scope) { double }

    it "passes the token and applies the params" do
      expect(subject).to receive(:pass_headers)
        .with(BaseCrm::Note)
        .and_return(scope)

      expect(scope).to receive(:params)
        .with({
          :noteable_type => noteable_type,
          :noteable_id => subject.id
        }).and_return(scope)

      expect(scope).to receive(:create)
        .with({
          :content => message,
          :noteable_type => noteable_type,
          :noteable_id => subject.id
        }).and_return(note)

      expect(subject.notes.create(:content => message)).to eq(note)
    end

  end

  describe "#create_note" do
    let(:message) { double }
    let(:notes) { double }
    let(:note) { double }

    it "creates a new note" do
      expect(subject).to receive(:notes).and_return(notes)

      expect(notes).to receive(:create)
        .with({
          :content => message
        }).and_return(note)

      expect(subject.create_note(message)).to eq(note)
    end

  end

end

