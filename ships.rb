require './spaces'
require './grid'
class Ship

  attr_reader :length, :horizontal

  def initialize length=nil, horizontal=nil
    @length = length
    @horizontal = horizontal
  end  

  def place grid, length, row, column
    if horizontal
      length.times do 
        grid.board[row][column].is_ship
        column += 1
      end
    else
      length.times do 
        grid.board[row][column].is_ship
        row += 1
      end
    end 
  end
end

class Patrolboat < Ship
  def initialize 
    @length = 2
  end

end