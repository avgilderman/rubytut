def test_format(format_string)
  puts "Testing #{format_string} : #{format(fo rmat_string, 12.3456)}"
end

test_format "%.2f"
