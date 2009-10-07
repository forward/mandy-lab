require "rubygems"
require "mandy"

Mandy.job "Grep" do
  map_tasks 5
  reduce_tasks 3
  
  map do |line|
    emit(line, 1) if (line =~ /#{parameter(:pattern)}/)
  end
  
  reduce do |line, matches|
    emit(line)
  end
end