# frozen_string_literal: true

filename = 'test_file'
output_dir = File.join(__dir__, 'output')
save_dir = File.join(output_dir, filename)
number = '2'

filename_pattern = File.join(output_dir, filename, "#{filename}_part_#{number}.mp4")

puts filename_pattern
