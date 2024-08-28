# frozen_string_literal: true

require 'fileutils'
Dir.chdir('folders')
Dir.glob('*.*') do |file_name|
  folder_name = File.basename(file_name, '.*')
  FileUtils.mkdir_p(folder_name)
  FileUtils.mv(file_name, folder_name)
  puts "Файл #{file_name} перенесен в папку #{folder_name}"
end
