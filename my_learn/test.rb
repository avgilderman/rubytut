# frozen_string_literal: true

module GemManager
  def self.gem_installed?(gem_name)
    # Эмулируем успешную установку для определённых гемов
    return true if gem_name == 'rails'

    # Эмулируем неудачную установку для других гемов
    false
  end

  def self.install_gem(gem_name)
    # Подставим успешную установку для gem 'rails'
    if gem_name == 'rails'
      return true
    elsif gem_name == 'non_existing_gem'
      # Имитируем ошибку установки для 'non_existing_gem'
      raise Gem::InstallError, "Ошибка установки для гема #{gem_name}"
    end

    false
  end

  def self.check_and_install_gems(required_gems)
    required_gems.each do |gem_name|
      next if gem_installed?(gem_name)

      begin
        if install_gem(gem_name)
          unless gem_installed?(gem_name)
            puts "Гем #{gem_name} установлен, но не подключается. Перезапустите приложение."
          end
        else
          puts "Не удалось установить гем #{gem_name}. Пожалуйста, установите его вручную."
        end
      rescue Gem::InstallError => e
        puts "Ошибка установки: #{e.message}"
      end
    end

    puts 'Все необходимые гемы проверены.'
  end
end

# Тестируем разные сценарии
gems_to_check = ['rails', 'non_existing_gem', 'existing_gem']

GemManager.check_and_install_gems(gems_to_check)
