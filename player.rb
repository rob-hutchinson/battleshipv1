require 'pry'
require './ships'
require './grid'
require './spaces'

class Player

  attr_reader :total_hits, :name

  def initialize
    @pat_hits = 2
    @dest_hits = 3
    @sub_hits = 3
    @bat_hits = 4
    @car_hits = 5
    @total_hits = 0 
    @name = ""
  end

  def new_name name
    @name = name
  end

  def pat_hits    
    @pat_hits -= 1
    if @pat_hits == 0
      puts "You sunk the Patrolboat!"
    end
  end

  def dest_hits
    @dest_hits -= 1
    if @dest_hits == 0
      puts "You sunk the Destroyer!"
    end
  end

  def sub_hits
    @sub_hits -= 1
    if @sub_hits == 0
      puts "You sunk the Submarine!"
    end
  end

  def bat_hits
    @bat_hits -= 1
    if @bat_hits == 0
      puts "You sunk the Battleship!"
    end
  end

  def car_hits
    @car_hits -= 1
    if @car_hits == 0
      puts "You sunk the Carrier!"
    end
  end

end
