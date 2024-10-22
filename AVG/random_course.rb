courses_path = '/Volumes/webdav.yandex.ru//films/serials/'
array_files_and_dir = Dir.entries(courses_path).sample

puts "Предлагаю тебе пройти курс:\n#{array_files_and_dir}"
