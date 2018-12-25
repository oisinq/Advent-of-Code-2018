class Celle
  include Comparable

  attr_reader :x, :y
  attr_accessor :id

  def initialize(x, y, id)
    @x, @y, @id = x, y, id
  end

  def to_s
    str = "#{@x} - #{@y}"
    if @id != -1
      str += ": ID #{@id}"
    end
    str
  end
end