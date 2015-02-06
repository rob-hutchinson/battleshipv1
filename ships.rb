require './spaces'
require './grid'
class Ship

  attr_reader :length, :horizontal

  def initialize
    # @length = length
    # @horizontal = horizontal
  end  

  def place grid, row:, col: #length, row, column
    if horizontal
      @length.times do 
        grid.board[row][col].is_ship
        column += 1
      end
    else
      @length.times do 
        grid.board[row][col].is_ship
        row += 1
      end
    end 
  end
end



class Patrolboat < Ship
  def initialize horizontal = nil
    @length = 2
    @horizontal = horizontal
  end
end

class Destroyer < Ship
  def initialize horizontal = nil
    @length = 3
    @horizontal = horizontal
  end
end

class Carrier < Ship
  def initialize horizontal = nil
    @length = 5
    @horizontal = horizontal
  end
end

class Sub < Ship
  def initialize horizontal = nil
    @length = 3
    @horizontal = horizontal
  end
end

class Battleship < Ship
  def initialize horizontal = nil
    @length = 4
    @horizontal = horizontal
  end
end