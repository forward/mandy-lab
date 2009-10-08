require "rubygems"
require "mandy"

Mandy.job "Word Scoring" do
  map_tasks 5
  reduce_tasks 3
  
  store(:hbase, :wordstore, :url => 'http://hadoopmaster.cluster.trafficbroker.co.uk:60050/api')
  
  map do |line|
    line.split(' ').each {|word| emit(word, 1) }
  end
  
  reduce do |word, occurrences|
    put(:wordstore, word, :score => 1.0/occurrences.size.to_f)
    emit(word, 1/occurrences.size)
  end
end
