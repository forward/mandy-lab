require "rubygems"
require "mandy"

Mandy.job "Prepare input: unique words in file" do
  map_tasks 5
  reduce_tasks 1
  
  map do |line|
    line.split(' ').each do |word|
      word.downcase!
      word.gsub!(/\W|[0-9_]/, '')
      next if word.size == 0
      
      emit(word, parameter(:file))
    end
  end
  
  reduce do |word, values|
    emit(word, values.first)
  end
end

# this is an
# > this, test_file
# > is, test_file
# > an, test_file

# mandy-local 4_exclusive_words/prepare_input.rb input/alice.txt output -v file=alice