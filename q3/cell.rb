class Cell
  attr_reader :x, :y
  def initialize(x, y)
    @x = x
    @y = y
  end

  def ==(other)
    @x == other.x && @y == other.y
  end

  def to_s
    "(#{@x}, #{@y})"
  end

  def hash
     [@x, @y].hash
  end

  def eql?(other)
    @x == other.x && @y == other.y
  end
end