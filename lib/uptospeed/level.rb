class Level
  attr_accessor :level, :points, :start_level, :next_level

  def initialize(points)
    @points = points
    @level, @start_level, @next_level = to_level
  end

  private

  def to_level
    case @points
      when 0..39 then return 1, 0, 40
      when 40..89 then return 2, 40, 90
      when 90..159 then return 3, 90, 160
      when 160..249 then return 4, 160, 250
      when 250..374 then return 5, 250, 375
      when 375..499 then return 6, 375, 500 # first cashout
      when 500..624 then return 7, 500, 625
      when 625..750 then return 8, 625, 750
      when 750..9999 then return 9, 750, 0 # second cashout
    end
  end
end