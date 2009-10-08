require "rubygems"
require "mandy"

# input:
# this, test_file
# is, test_file
# an, test_file

Mandy.job "Exclusive words" do
  map_tasks 5
  reduce_tasks 1

  reduce do |word, files|
    wanted_in_file = parameter(:wanted_in)
    next unless files.all? {|file| file == wanted_in_file}
    
    emit(word)
  end
end