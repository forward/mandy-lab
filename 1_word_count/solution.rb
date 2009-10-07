require "rubygems"
require "mandy"

Mandy.job "Word Count" do
  map_tasks 5
  reduce_tasks 3
  
  map do |line|        
    line.split(' ').each do |word|
      word.downcase!
      word.gsub!(/\W|[0-9_]/, '')
      next if word.size == 0
      emit(word, 1)
    end
  end
  
  reduce do |word, occurrences|
    emit(word, occurrences.size)
  end
end