require 'rubygems'
require 'mandy'
require File.join(File.dirname(__FILE__), 'solution')

describe "Word Count Solution 1" do
  before(:all) do
    @runner = Mandy::TestRunner.new("Word Count")
  end
  
  describe "mapper" do
    it "splits on spaces and emits words" do
      @runner.map("Fake carl") do |mapper|
        mapper.should_receive(:emit).with('fake', 1)
        mapper.should_receive(:emit).with('carl', 1)
      end
    end

    it "emits downcased words" do
      @runner.map("Some") do |mapper|
        mapper.should_receive(:emit).with('some', 1)
      end
    end
    
    it "removes non-word characters" do
      @runner.map("Alice!") do |mapper|
        mapper.should_receive(:emit).with('alice', 1)
      end
    end
  end
  
  describe "reducer" do
    it "counts occurrences" do
      occurrences = [1,1,1,1]
      @runner.reduce('andy' => occurrences) do |reducer|
        reducer.should_receive(:emit).with('andy', 4)
      end
    end
  end
  
end