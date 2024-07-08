# frozen_string_literal: true

include Math

PI_value = Math::PI
E_value = Math::E

puts "Значение PI: #{PI_value}"
puts "Значение E: #{E_value}"

sum_pi = (Math.sin(PI_value) + Math.cos(PI_value)).round(2)
puts sum_pi
