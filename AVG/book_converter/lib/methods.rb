# frozen_string_literal: true

require 'find'

Find.find('.') do |path|
  puts path if File.extname(path) == '.rb'
end


puts File.expand_path('..', __dir__)
