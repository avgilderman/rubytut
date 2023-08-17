class Question
  def initialize(question, right_answer, scores)
    @right_answer = right_answer
    @question = question
    @scores = scores
  end
  
  def right_answer
    return @right_answer
  end

  def question
    return @question
  end

  def scores
    return @scores
  end

end
