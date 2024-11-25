require 'pry'

def level_4
  binding.pry
  puts 'Level 4'
end

def level_3
  level_4
  binding.pry
  puts 'Level 3'
end

def level_2
  level_3
  binding.pry
  puts 'Level 2'
end

def level_1
  level_2
  binding.pry
  puts 'Level 1'
end

level_1
