# frozen_string_literal: true

require_relative 'gem_manager'

test_gems = [
  'nokogiri',
  'httparty'
]

GemManager.check_and_install_gems(test_gems)
