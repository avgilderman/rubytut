# frozen_string_literal: true

def outer_method
  x = 10

  3.times do |i|
    x += i
  end

  puts x
end

outer_method
