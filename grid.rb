require './spaces'
require './ships'
require './player'

class Grid
  attr_reader :board
  def initialize row_count, col_count
    @row_count, @col_count = row_count, col_count
    @board = []
    #@board << [" A ", " B ", " C ", " D ", " E ", " F ", " G ", " H ", " I ", " J "]
    row_count.times do
      row = []
      col_count.times do
        space = Space.new
        row.push space
      end
      @board.push row
    end
  end

  def display
    @board.each do |row|
      display_row row
    end
  end

  def display_row row
    row.each do |space|
      if space.shot && space.ship
        print " X "
      elsif space.shot && !space.ship
        print " 0 "
      else
        print " + "
      end
    end
    puts "\n"
  end

  def display_hidden
    @board.each do |row|
      display_hidden_row row
    end
  end

  def display_hidden_row row
    row.each do |space|
      if space.shot && space.ship
        print " X "
      elsif space.shot && !space.ship
        print " 0 "
      elsif
        if space.patrol
          print " P "
        elsif space.sub
          print " S "
        elsif space.batship
          print " B "
        elsif space.dest
          print " D "
        elsif space.carrier
          print " C "
        else
          print " + "
        end
      end
    end
    puts "\n"
  end

  def check x, y, row, col
    binding.pry
    if x.board[row][col].shot
      puts "You already tried that! Fire again!"
      return false
    elsif x.board[row][col].ship
      x.board[row][col].shot_at
      puts "HIT!"
      x.ship_type(x, y, row,col)
      return true
    else
      x.board[row][col].shot_at
      puts "MISS!"
      return true
    end
  end

  def ship_type x, y, row, col
    if x.board[row][col].patrol
      y.pat_hits
    elsif x.board[row][col].dest
      y.dest_hits
    elsif x.board[row][col].sub
      y.sub_hits
    elsif x.board[row][col].batship
      y.bat_hits
    else
      y.car_hits
    end
  end
end