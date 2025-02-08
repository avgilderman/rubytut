# frozen_string_literal: true

require_relative 'gem_manager'

# Массив гемов, которые нужно проверить и установить
required_gems = %w[nokogiri httparty some_nonexistent_gem]

# Вызов метода для проверки и установки гемов
GemManager.check_and_install_gems(required_gems)
