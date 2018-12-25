require_relative '../q6/cell'

class Grid

  def initialize(x_size, y_size)
    @grid = Array.new(x_size+1) {Array.new(y_size+1)}
    (x_size+1).times do |x|
      (y_size+1).times do |y|
        @grid[x][y] = Celle.new(x, y, -1)
      end
    end
    @sites = []
    @counter = Hash.new(0)
  end

  def add(cell)
    @grid[cell.x][cell.y] = cell
    @sites << cell
  end

  def calculate
    @grid.each_index do |x|
      @grid[0].each_index do |y|
        closest_cell = find_closest(@grid[x][y])
        #print "#{closest_cell.id},"
        @counter[closest_cell] += 1
      end
     # puts " "
    end
   @counter
  end

  def find_closest(cell)
    closest_cell = nil
    closest_dist = Float::INFINITY
    @sites.each do |site|
      if manhattan(site, cell) < closest_dist
        if manhattan(site, cell) == closest_dist
          return nil
        end
        closest_dist = manhattan(site, cell)
        closest_cell = site
      end
    end
    closest_cell
  end

  # def find_closest(cell)
  #   x = cell.x
  #   y = cell.y
  #   id = -1
  #   i = 1
  #   while true
  #     if @grid[x-i][y].nil? && x-i >= 0
  #       if @grid[x-i][y].id != -1
  #         if id == -1
  #           id = @grid[x-i][y].id
  #         else
  #           return -2
  #         end
  #       end
  #     end
  #     if @grid[x+i][y].nil? && x+i >= 0
  #       if @grid[x+i][y].id != -1
  #         if id == -1
  #           id = @grid[x+i][y].id
  #         else
  #           return -2
  #         end
  #       end
  #     end
  #     if @grid[x][y-i].nil? && y-i >= 0
  #       if @grid[x][y-i].id != -1
  #         id = @grid[x][y-i].id
  #       else
  #         return -2
  #       end
  #     end
  #     if @grid[x][y+i].nil? && y+i >= 0
  #       if @grid[x][y+i].id != -1
  #         id = @grid[x][y+i].id
  #       else
  #         return -2
  #       end
  #     end
  #     if id != -1
  #       return id
  #     end
  #     i += 1
  #   end
  # end

  def manhattan(cell1, cell2)
    (cell1.x-cell2.x).abs + (cell1.y-cell2.y).abs
  end
  # def find_closest(cell)
  #   id = -1
  #   x = cell.x
  #   y = cell.y
  #   while id == -1
  #     if grid[x-1][y].nil?
  #       if grid[x-1][y].id != -1
  #         if id == -1
  #           id = grid[x-1][y].id
  #         else
  #           return -2
  #         end
  #       end
  #     end
  #     if grid[x+1][y].nil?
  #       if grid[x+1][y].id != -1
  #         if id == -1
  #           id = grid[x+1][y].id
  #         else
  #           return -2
  #         end
  #       end
  #     end
  #     if grid[x][y-1].nil?
  #       if grid[x][y-1].id != -1
  #         id = grid[x][y-1].id
  #       else
  #         return -2
  #       end
  #     end
  #     if grid[x][y+1].nil?
  #       if grid[x][y+1].id != -1
  #         id = grid[x][y+1].id
  #       else
  #         return -2
  #       end
  #     end
  #   end
  #   return id
  # end
end