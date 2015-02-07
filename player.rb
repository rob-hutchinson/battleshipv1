require 'pry'
require './ships'
require './grid'
require './spaces'

class Player

  attr_reader :pat_hits, :dest_hits, :sub_hits, :bat_hits, :car_hits, :total_hits, :name

  def initialize
    @pat_hits = 0
    @dest_hits = 0
    @sub_hits = 0
    @bat_hits = 0
    @car_hits = 0
    @total_hits = 0 
    @name = ""
  end

  def new_name name
    @name = name
  end

end
