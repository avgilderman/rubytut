class Question
  def initialize(questinon, answer, points)
    @questinon = questinon
    @answer = answer
    @points = points
  end
  
  #геттеры:
  def questinon
    return @questinon
  end

  def answer
    return @answer
  end

  def points
    return @points
  end

end
