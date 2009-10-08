require "rubygems"
require "mandy"

Mandy.job "Super Grep" do
  map_tasks 5
  reduce_tasks 3
  
  map do |line|
    next unless (line =~ /#{parameter(:pattern)}/)
    emit(line, 1)
    increment_counter("No. of unique matches")
  end
  
  reduce do |line, matches|
    emit(line)
    increment_counter("No. of unique matches")
  end
end