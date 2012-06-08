class Level
  attr_accessor :level, :points, :start_level, :next_level

  def initialize(points)
    @points = points
    @level, @start_level, @next_level = to_level
  end

  private

  def to_level
    case @points
      when 0..8 then return 1, 0, 9
      when 9..37 then return 2, 9, 38
      when 38..84 then return 3, 38, 85
      when 85..149 then return 4, 85, 150
      when 150..234 then return 5, 150, 235
      when 235..374 then return 6, 235, 375
      when 375..461 then return 7, 375, 462 # first cashout
      when 462..619 then return 8, 462, 620
      when 620..749 then return 9, 620, 750
      when 750..9999 then return 10, 749, 0 # second cashout
    end
  end
end