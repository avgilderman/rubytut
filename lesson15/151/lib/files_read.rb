class Read_files

  def read_files(directory)
    Dir["#{__dir__}/#{directory}"]
    .sort
    .map { |file_name| File.read(file_name) }
  end

end

