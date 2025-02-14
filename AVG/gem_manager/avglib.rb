# frozen_string_literal: true

# Модуль с универсальными методами для программ
module AVGlib
  # Метод для запуска main файла из любой директории
  def rootdir
    root_dir = File.dirname(File.expand_path(__FILE__))
    Dir.chdir(root_dir)
  end
end
