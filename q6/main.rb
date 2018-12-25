require_relative '../q6/cell'
require_relative 'grid'

cells = []

id = 0
File.open("input.txt", "r") do |f|
  f.each_line do |line|
    line = line.split
    x = line[0].to_i
    y = line[1].to_i

    cell = Celle.new(x, y, id)
    cells << cell
    id += 1
  end
end

cell = cells.min_by {|cell| cell.x}

leftmost_cell = cells.min_by {|cell| cell.x}
upmost_cell = cells.min_by {|cell| cell.y}
rightmost_cell = cells.max_by {|cell| cell.x}
downmost_cell = cells.max_by {|cell| cell.y}

grid = Grid.new(rightmost_cell.x, downmost_cell.y)

cells.each do |cell|
  grid.add(cell)
end

puts grid

hash = grid.calculate

puts leftmost_cell
puts rightmost_cell
puts upmost_cell
puts downmost_cell

cells.each do |cell|
  if leftmost_cell.x == cell.x || rightmost_cell.x == cell.x || upmost_cell.y == cell.y || downmost_cell.y == cell.y || cell.x == 0 || cell.x == 349 || cell.y == 0 || cell.y == 349
    hash.delete(cell)
  end
end

# hash.delete(leftmost_cell)
# hash.delete(upmost_cell)
# hash.delete(rightmost_cell)
# hash.delete(downmost_cell)
puts hash.max_by{|k,v| v}