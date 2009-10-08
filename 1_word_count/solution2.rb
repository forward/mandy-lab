require "rubygems"
require "mandy"

Mandy.job "Word Count" do
  map_tasks 5
  reduce_tasks 3
  
  map do |line|
    words = {}
        
    line.split(' ').each do |word|
      word.downcase!
      word.gsub!(/\W|[0-9]/, '')
      next if word.size == 0
      words[word] ||= 0 
      words[word] += 1
    end
    
    words.each {|word, count| emit(word, count) }
    increment_counter("No. of words processed", words.size)
  end
  
  reduce(Mandy::Reducers::SumReducer)
end