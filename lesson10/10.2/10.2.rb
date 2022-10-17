puts "Составим фоторобот типичного либерала:"
current_path = File.dirname(__FILE__)
path_eyes = current_path + "/data/eyes.txt"
path_forehead = current_path + "/data/foreheads.txt"
path_mouths = current_path + "/data/mouths.txt"
path_noses = current_path + "/data/noses.txt"

array_eyes = []
file_eyes = File.new(path_eyes, "r:UTF-8")
array_eyes = file_eyes.readlines
file_eyes.close

array_forehead = []
file_forehead = File.new(path_forehead, "r:UTF-8")
array_forehead = file_forehead.readlines
file_forehead.close

array_mouths = []
file_mouths = File.new(path_mouths, "r:UTF-8")
array_mouths = file_mouths.readlines
file_mouths.close

array_noses = []
file_noses = File.new(path_noses, "r:UTF-8")
array_noses = file_noses.readlines
file_noses.close

puts array_forehead.sample
puts array_eyes.sample
puts array_noses.sample
puts array_mouths.sample
