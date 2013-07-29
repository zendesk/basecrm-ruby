shared_examples "taskable" do |taskable_type|

  let(:scope) { double }

  describe "#tasks" do
    let(:fetch_scope) { double }

    it "passes the token and applies the params" do
      subject.
        should_receive(:pass_headers).
        with(BaseCrm::Task).
        and_return(scope)
      scope.should_receive(:params).
        with({
          :taskable_type => taskable_type,
          :taskable_id => subject.id
        }).and_return(fetch_scope)
      subject.tasks.should == fetch_scope
    end

  end

  describe "#create_task" do
    let(:params) do
      { :content => task_content }
    end
    let(:task_content) { double }
    let(:task) { double }

    it "creates a new task" do
      subject.
        should_receive(:pass_headers).
        with(BaseCrm::Task).
        and_return(scope)
      scope.should_receive(:create).with({
        :content => task_content,
        :taskable_type => taskable_type,
        :taskable_id => subject.id
      }).and_return(task)
      subject.create_task(params).should == task
    end

  end

end


