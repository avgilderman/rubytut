# frozen_string_literal: true

# Библиотека методов для GemManager
module Library
  # проверка подключения гема
  def self.gem_installed?(gem_name)
    require gem_name
    true
  rescue LoadError
    false
  end

  # Выводы ошибок
  module ErrorHandler
  
    def self.puts_install_error(error, gem_name)
    puts "Ошибка установки: #{error.message}" # При любой ошибке выводить месседж
    # если error это ошибкой доступа - обратиться к suggest_manual_install
    suggest_manual_install(gem_name) if error.is_a?(Errno::EACCES)
  end

  def self.suggest_manual_install(gem_name)
    if Gem.win_platform?
      puts "Попробуйте запустить от администратора: gem install #{gem_name}"
    else
      puts "Попробуйте: sudo gem install #{gem_name}"
    end
  end

  rescue Gem::UnsatisfiableDependencyError
  puts "Ошибка: не удалось найти или установить гем '#{gem_name}'."
  puts "Проверьте правильность имени или установите вручную: gem install #{gem_name}"
  false

  rescue Gem::InstallError, Errno::EACCES => e
  Library.puts_install_error(e, gem_name)
  false
  
  rescue StandardError => e
  puts "Произошла неизвестная ошибка при установке '#{gem_name}': #{e.message}"
  puts "Попробуйте установить вручную: gem install #{gem_name}"
  false

    
  end
  

end
