# frozen_string_literal: true

require 'fileutils'
require_relative 'lib/methods'

file_path = 'data/data.txt'
folder_name = 'archive'

full_file_path = file_path(file_path) # есть ли входной файл? Узнать полный путь файла
file_name = clear_file_name(file_path) # узнать имя входного файла
create_directory(folder_name) # создаем директорию для выходных файлов
create_files(full_file_path, folder_name, file_name) # создаём выходные файлы
