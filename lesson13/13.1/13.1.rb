class Book
  def initialize(book_autor, book_name, date_of_first_pub)
    @book_autor = book_autor
    @book_name = book_name
    @date_of_first_pub = date_of_first_pub
  end

  def book_autor
    return @book_autor
  end
  
  def book_name
    return @book_name
  end
  
  def date_of_first_pub
    return @date_of_first_pub
  end
end

book_1 = Book.new("Татьяна Снежина", "Дождь", "1972.05.14")
book_2 = Book.new("Александр Солженицын", "Архипелаг Гулаг","1918.12.11")

puts "любимая книга номер 1:"
puts book_1.book_autor
puts "любимая книга номер 2:"
puts book_2.book_name
