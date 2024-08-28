# frozen_string_literal: true

path = 'create_files_for_tests/folders'
Dir.chdir(path)
files = Dir.glob('*.txt')
files.each_with_index do |file, index|
  new_name = "file_#{index + 1}.txt"
  File.rename(file, new_name)
end
