require File.join(File.dirname(__FILE__), 'solution')

describe "Sorted Word Count" do  
  describe "End to end test" do
    it "sorts counts" do
      runner = Mandy::TestRunner.end_to_end
      output = StringIO.new('')
      runner.execute(StringIO.new("fake carl is not real\nreal carl is real\n"), output)
      output.readlines.should == ["fake\t1\n", "not\t1\n", "carl\t2\n", "is\t2\n", "real\t3\n"]
    end
  end

  describe "Word Count Job" do
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
  
  describe "Word Count: Sorting Job" do
    before(:all) do
      @runner = Mandy::TestRunner.new("Word Count: Sorting")
    end

    describe "mapper" do
      it "transposes count and word" do
        @runner.map("carl\t1\nfake\t2") do |mapper|
          mapper.should_receive(:emit).with(2, 'fake')
          mapper.should_receive(:emit).with(1, 'carl')
        end
      end
    end
    
    describe "reducer" do
      it "transposes back to word and count" do
        @runner.reduce("1\tcarl\n2\tfake") do |mapper|
          mapper.should_receive(:emit).with('fake', 2)
          mapper.should_receive(:emit).with('carl', 1)
        end        
      end
    end
  end
end