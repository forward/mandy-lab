require "rubygems"
require "mandy"

Mandy.job "Line Scoring" do
  map_tasks 5
  reduce_tasks 3
  
  store(:hbase, :wordstore, :url => 'http://hadoopmaster.cluster.trafficbroker.co.uk:60050/api')
  
  map do |line|
    line.split(' ').inject(0) do |score, word|
      word_data = get(:wordstore, word)
      score += word_data[:score]
    end
    emit(1_000_000-score, line)
  end
  
  reduce do |score, line|
    put(1_000_000-score, line)
  end
end
