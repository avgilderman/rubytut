# frozen_string_literal: true

require 'net/dav'
require 'addressable/uri'
require 'cgi'

WEBDAV_URL = 'https://webdav.yandex.ru'
CREDENTIALS_FILE = '/home/alex/credential/dav_cred.txt'
SERIALS_PATH = '/films/serials'

def read_credentials(file_path)
  credentials = {}
  File.foreach(file_path) do |item|
    key, value = item.chomp.split(': ')
    credentials[key] = value
  end
  credentials
end

def webdav(credentials, webdav_url, serials_path)
  webdav = Net::DAV.new(webdav_url, curl: false)
  webdav.credentials(credentials['username'], credentials['password'])
  file_or_dir = [] # масив для сохранения списка файлов и папок
  webdav.find(serials_path) do |item|
    item_url = CGI.unescape(item.url) # Декодирование URL для отображения символов
    formatted_url = item_url.sub(/^https/, 'https://') # Корректировка схемы URL
    cleaned_url = formatted_url.gsub(/\s+/, ' ') # Замена последовательностей пробелов на один пробел
    file_or_dir << cleaned_url # Добавление очищенного URL в массив
  end

  file_or_dir # Возврат массива с именами файлов и директорий
end

# Чтение учетных данных из файла
credentials = read_credentials(CREDENTIALS_FILE)
# Получение списка файлов и директорий и вывод на экран
puts webdav(credentials, WEBDAV_URL, SERIALS_PATH)

# regexes = [/^\.*/]

# # выбирает случайный фильм
# def sample_films(courses_path)
#   Dir.entries(courses_path).sample
# end

# if array_files_and_dir =~ /^\.*/

# puts "Предлагаю тебе сегодня посмотреть:\n#{array_files_and_dir}"
