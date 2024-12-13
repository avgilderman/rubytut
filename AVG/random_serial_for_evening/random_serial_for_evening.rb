# frozen_string_literal: true

require 'net/dav'
require 'addressable/uri'
require 'cgi'

WEBDAV_URL = 'https://webdav.yandex.ru'
CREDENTIALS_FILE = '/home/alex/base/credential/dav_cred.txt'
SERIALS_PATH = '/films/serials'

def read_credentials(file_path)
  credentials = {}
  File.foreach(file_path) do |item| # читает построчно
    key, value = item.chomp.split(': ')
    credentials[key] = value
  end

  credentials
end

def webdav(credentials, webdav_url, serials_path)
  prefix = File.join(webdav_url, "#{serials_path}/")
  webdav = Net::DAV.new(webdav_url, curl: false)
  webdav.credentials(credentials['username'], credentials['password'])
  file_or_dir = []
  webdav.find(serials_path) do |item|
    item_url = CGI.unescape(item.url)
    cleaned_url = item_url.delete_prefix(prefix).gsub(/\s+/, ' ').chomp('/')
    file_or_dir << cleaned_url
  end

  file_or_dir
end

credentials = read_credentials(CREDENTIALS_FILE)

films = webdav(credentials, WEBDAV_URL, SERIALS_PATH)

puts "Предлагаю тебе сегодня посмотреть: #{films.sample}"
