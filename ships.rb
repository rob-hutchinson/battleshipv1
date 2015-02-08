require './spaces'
require './grid'
class Ship

  attr_reader :length, :horizontal

  def initialize horizontal = nil
    # @length = length
    @horizontal = horizontal
  end  

  def check_place grid, row:, col:
    legal = true
    sub = grid.board[row]
    if @horizontal 
      @length.times do
        if sub.at(col) == nil || grid.board[row][col].ship
          legal = false
        end
        col += 1
      end
    else
      @length.times do
        if grid.board.at(row) == nil || grid.board[row][col].ship
          legal = false
        end
        row += 1
      end
    end
    legal
  end

  def place grid, row:, col:
    if @horizontal
      @length.times do 
        grid.board[row][col].is_ship
        if @length == 2
          grid.board[row][col].is_patrol
        elsif @length == 4
          grid.board[row][col].is_batship
        elsif @length == 5
          grid.board[row][col].is_carrier
        else
          if @d
            grid.board[row][col].is_dest
          else
            grid.board[row][col].is_sub
          end
        end
        col += 1
      end
    else
      @length.times do 
        grid.board[row][col].is_ship
        if @length == 2
          grid.board[row][col].is_patrol
        elsif @length == 4
          grid.board[row][col].is_batship
        elsif @length == 5
          grid.board[row][col].is_carrier
        else
          if @d
            grid.board[row][col].is_dest
          else
            grid.board[row][col].is_sub
          end
        end
        row += 1
      end
    end 
  end

end

class Patrolboat < Ship
  def initialize horizontal = nil
    super
    @length = 2
    @horizontal = horizontal
    @hits = 0
  end
end

class Destroyer < Ship
  def initialize horizontal = nil
    super
    @length = 3
    @horizontal = horizontal
    @hits = 0
    @d = true
  end
end

class Carrier < Ship
  def initialize horizontal = nil
    super
    @length = 5
    @horizontal = horizontal
    @hits = 0
  end
end

class Sub < Ship
  def initialize horizontal = nil
    super
    @length = 3
    @horizontal = horizontal
    @hits = 0
  end
end

class Batship < Ship
  def initialize horizontal = nil
    super
    @length = 4
    @horizontal = horizontal
    @hits = 0
  end
end