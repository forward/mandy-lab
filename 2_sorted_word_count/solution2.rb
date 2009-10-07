require "rubygems"
require "mandy"

MAX_WORDS = 100_000

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


Mandy.job "Descending Sorted Word Count" do
  map_tasks 5
  reduce_tasks 1
  
  map do |word, count|        
    emit(MAX_WORDS-count.to_i, word)
  end
  
  reduce do |count, words|
    words.each {|word| emit(word, MAX_WORDS-count.to_i) }
  end
end