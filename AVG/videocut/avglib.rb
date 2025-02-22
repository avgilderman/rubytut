# frozen_string_literal: true

require 'fileutils' # нужен для create_folders
require 'bundler' # нужен для запуска bundler в программе
require 'bundler/cli' # нужен для запуска установки гемов из gemfile

# Модуль с универсальными методами для программ v1
module AVGlib
  # метод для запуска main файла из любой директории локальной ОС
  def self.rootdir
    root_dir = File.dirname(File.expand_path(__FILE__))
    Dir.chdir(root_dir)
    root_dir
  end

  # метод для создания папок (принимает массив переменных с путями)
  def self.create_folders(folders)
    folders.each do |folder|
      FileUtils.mkdir_p(folder)
      puts "Папка #{folder} создана"
    rescue StandardError => e
      puts "Ошибка создания папки '#{folder}': #{e.message}"
    end
  end

  # метод для автоматической установки гемов из bundle непосредственно во время первого исполнения программы
  def self.install_gemfile
    gemfile_path = File.join(rootdir, 'Gemfile')
    if File.exist?(gemfile_path) # если gemfile существует, то
      Bundler::CLI.start(['install']) unless File.exist?(File.join(rootdir, 'Gemfile.lock')) # если файла lock нет
    else
      puts 'Gemfile не найден в корневой директории проекта.'
    end
  end
end
