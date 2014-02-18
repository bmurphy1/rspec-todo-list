require "rspec"

require_relative "list"
require_relative "task"

describe List do
  let(:title) {"My list"}
  let(:list) {List.new(title)}
  let(:task_1) {Task.new("go to sleep")}
  let(:task_2) {Task.new("sleep in")}

  describe "#initialize" do
    it "raise an error if there are no arguments" do
      expect {List.new()}.to raise_error(ArgumentError)
    end

    it "takes a title that is a string" do
      list = List.new("my list")
      expect(list.title).to eq("my list")
    end
  end

  describe "#add_task" do
    it "adds tasks to the list" do
      expect(list.add_task(task_1)).to eq([task_1])
    end
  end

  describe "#complete_task" do
    it "completes task in array by index" do
      list.add_task(task_1)
      list.complete_task(0)
      expect(list.tasks[0].complete?).to eq(true)
    end
  end

  describe "#delete_task" do
    it "deletes task from tasks array" do
      list.add_task(task_1)
      list.delete_task(0)
      expect(list.tasks.empty?) == true
    end
  end

  describe "#completed_tasks" do
    it "returns completed tasks from tasks array" do
      list.add_task(task_1)
      list.add_task(task_2)
      list.complete_task(0)
      expect(list.completed_tasks).to eq([task_1])
    end
  end

  describe "#incompleted_tasks" do
    it "returns incomplete tasks from tasks array" do
      list.add_task(task_1)
      list.add_task(task_2)
      list.complete_task(0)
      expect(list.incomplete_tasks).to eq([task_2])
    end
  end
end













