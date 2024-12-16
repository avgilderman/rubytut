# frozen_string_literal: true

require 'fileutils'
require_relative 'lib/methods'

data_file_path = 'data/data.txt'
output_folder = 'archive'

full_file_path = file_path(data_file_path) # есть ли входной файл? Узнать полный путь файла
file_name = clear_file_name(data_file_path) # узнать имя входного файла
create_directory(output_folder) # создаем директорию для выходных файлов
create_files(full_file_path, output_folder, file_name) # создаём выходные файлы
