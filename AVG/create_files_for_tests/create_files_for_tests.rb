# frozen_string_literal: true

require_relative 'lib/methods'

folder_name = 'folder_test_files'
files_names = [
  'test1.txt',
  'test2.doc',
  'image1.png',
  'notes.pdf',
  'data.csv'
]

create_test_files(folder_name, files_names)
