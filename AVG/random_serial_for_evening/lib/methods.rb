# frozen_string_literal: true

require 'net/dav'
require 'addressable/uri'
require 'cgi'

# берет файл с кредами. Возвращает ключ-значение кредов
def read_credentials(file_path)
  credentials = {} # инициализация пустого хэша
  File.foreach(file_path) do |line| # читает построчно файл
    key, value = line.chomp.split(': ')
    credentials[key] = value
  end

  credentials
end

# метод выдает список файлов и папок в заданной директории webdav
def webdav(credentials, webdav_url, serials_path)
  full_path = File.join(webdav_url, "#{serials_path}/")
  webdav = Net::DAV.new(webdav_url, curl: false)
  webdav.credentials(credentials['username'], credentials['password'])
  file_or_dir = []
  webdav.find(serials_path) do |item|
    item_url = CGI.unescape(item.url)
    cleaned_url = item_url.delete_prefix(full_path).gsub(/\s+/, ' ').chomp('/')
    file_or_dir << cleaned_url
  end

  file_or_dir
end
