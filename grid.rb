require './spaces'
require './ships'

class Grid
  attr_reader :board
  def initialize row_count, col_count
    @row_count, @col_count = row_count, col_count
    @board = []
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
  
end