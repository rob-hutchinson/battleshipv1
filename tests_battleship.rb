
require 'pry'

require 'minitest/autorun'
require './spaces'

class SpacesTests < Minitest::Test
  def test_space_is_not_ship
    s = Space.new 
    assert !s.ship
    refute s.ship
  end 

  def test_space_is_not_shot
    s = Space.new
    assert !s.shot
    refute s.shot
  end

  def test_ships_can_be_hit
    s = Space.new
    s.is_ship
    s.check
    assert s.shot 

    e = Space.new
    e.check
    refute e.shot
  end
  
end

# class GridTests < MiniTest::Test
#   def tests_it_can_make_a_grid
#     g = Grid.new (4,4)
#     assert 
#   end
# end

