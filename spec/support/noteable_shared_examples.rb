shared_examples "noteable" do |noteable_type|

  let(:scope) { double }

  describe "#notes" do
    let(:fetch_scope) { double }

    it "passes the token and applies the params" do
      subject.
        should_receive(:pass_headers).
        with(BaseCrm::Note).
        and_return(scope)
      scope.should_receive(:params).
        with({
          :noteable_type => noteable_type,
          :noteable_id => subject.id
        }).and_return(fetch_scope)
      subject.notes.should == fetch_scope
    end

  end

  describe "#notes.create" do
    let(:message) { mock }
    let(:note) { mock }
    let(:fetch_scope) { mock }

    it "passes the token and applies the params" do
      subject.
        should_receive(:pass_headers).
        with(BaseCrm::Note).
        and_return(scope)
      scope.should_receive(:params).
        with({
          :noteable_type => noteable_type,
          :noteable_id => subject.id
        }).and_return(scope)
      scope.should_receive(:create).with({
        :content => message,
        :noteable_type => noteable_type,
        :noteable_id => subject.id
      }).and_return(note)
      subject.notes.create(:content => message).should == note
    end

  end

  describe "#create_note" do
    let(:message) { mock }
    let(:notes) { mock }
    let(:note) { mock }

    it "creates a new note" do
      subject.should_receive(:notes).and_return(notes)
      notes.should_receive(:create).with({
        :content => message
      }).and_return(note)
      subject.create_note(message).should == note
    end

  end

end

