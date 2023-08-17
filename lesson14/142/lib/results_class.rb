class ResultsClass
  attr_reader :scores, :array_results, :results

  def initialize(scores, array_results)
    @scores = scores
    @array_results = array_results
    @results =
      case @scores
        when 30..32
          @array_results[0]
        when 25..29
          @array_results[1]
        when 19..24
          @array_results[2]
        when 14..18
          @array_results[3]
        when 9..13
          @array_results[4]
        when 4..8
          @array_results[5]
        else
          @array_results[6]
      end
  end
end
