shared_examples "taskable" do |taskable_type|

  let(:scope) { double }

  describe "#tasks" do
    let(:fetch_scope) { double }

    it "passes the token and applies the params" do
      expect(subject).to receive(:pass_headers)
        .with(BaseCrm::Task)
        .and_return(scope)

      expect(scope).to receive(:params)
        .with({
          :taskable_type => taskable_type,
          :taskable_id => subject.id
        }).and_return(fetch_scope)

      expect(subject.tasks).to eq(fetch_scope)
    end

  end

  describe "#tasks.create" do
    let(:params) do
      { :content => task_content }
    end
    let(:task_content) { double }
    let(:task) { double }

    it "creates a new task" do
      expect(subject).to receive(:pass_headers)
        .with(BaseCrm::Task)
        .and_return(scope)

      expect(scope).to receive(:params)
        .with({
          :taskable_type => taskable_type,
          :taskable_id => subject.id
        }).and_return(scope)

      expect(scope).to receive(:create)
        .with({
          :content => task_content,
          :taskable_type => taskable_type,
          :taskable_id => subject.id
        }).and_return(task)

      expect(subject.create_task(params)).to eq(task)
    end
  end

  describe "#create_task" do
    let(:params) do
      { :content => task_content }
    end
    let(:task_content) { double }
    let(:tasks) { double }
    let(:task) { double }

    it "creates a new task" do
      expect(subject).to receive(:tasks).and_return(tasks)

      expect(tasks).to receive(:create)
        .with({
          :content => task_content
        }).and_return(task)

      expect(subject.create_task(params)).to eq(task)
    end

  end

end


