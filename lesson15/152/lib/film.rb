class Film
  attr_reader :title, :director, :year
  
  def initialize(title, director, year)
    @title = title.to_s
    @director = director.to_s
    @year = year.to_i
  end

end
