# frozen_string_literal: true

require 'rubygems/dependency_installer'
require_relative 'Library'

# Автоматическая установка гемов перечисленных в массиве
module GemManager
  # Проверка и установка переданного массива гемов
  def self.check_and_install_gems(required_gems)
    required_gems.each { |gem_name| installation_process(gem_name) }
    puts 'Все необходимые гемы проверены'
  end

  # Процесс проверки и установки гема
  def self.installation_process(gem_name)
    return if Library.gem_installed?(gem_name) # возвращается обратно если гем установлен

    # но если гем не установлен:
    if install_gem(gem_name) # Попытка установки
      unless Library.gem_installed?(gem_name) # Если гем не подключается
        puts "Гем #{gem_name} установлен, но не подключается. Перезапустите приложение."
      end
    else
      puts "Не удалось установить гем #{gem_name}. Пожалуйста, установите его вручную."
    end
  end

  # попытка установки гема
  def self.install_gem(gem_name)
    installer = Gem::DependencyInstaller.new
    installer.install(gem_name)
    Gem.clear_paths
    true # Возвращаем true если установка удалась
  rescue StandardError => e
    Library.puts_install_error(e, gem_name)
    false
  end

  private_class_method :installation_process, :install_gem
end
