# frozen_string_literal: true

require_relative 'lib/methods'

WEBDAV_URL = 'https://webdav.yandex.ru'
CREDENTIALS_FILE = '/home/alex/base/credential/dav_cred.txt'
SERIALS_PATH = '/films/serials'

credentials = read_credentials(CREDENTIALS_FILE) # вытаскиваем креды из файла
films = webdav(credentials, WEBDAV_URL, SERIALS_PATH) # выводит список того, что есть по указанному пути

puts "Предлагаю тебе сегодня посмотреть: #{films.sample}"
