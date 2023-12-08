class Quiz
  attr_reader :title, :director, :year

  def initialize(title, director, year)
    @title = title.to_s
  end

end
