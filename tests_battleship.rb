require 'pry'

require 'minitest/autorun'
require './spaces'
require './grid'
require './ships'


class SpacesTests < Minitest::Test
  def test_space_is_not_ship
    s = Space.new 
    assert !s.ship
    refute s.ship
  end 

  def test_spaces_can_be_shot
    s = Space.new
    assert !s.shot
    s.shot_at
    assert s.shot
  end

end

class ShipsTest < Minitest::Test
  def test_ships_can_be_placed
    g = Grid.new(5,5)
    s = Destroyer.new

    s.place(g,col: 0, row: 0)
    assert g.board[0][0].ship
    assert g.board[1][0].ship
    assert g.board[2][0].ship
  end

  def test_ships_cant_be_placed_off_grid
    g = Grid.new(5,5)
    s = Carrier.new 
    # refute s.check_place(g, col: 3, row: 3)
    if s.check_place(g, col: 3, row: 3)
      s.place(g, col:3, row:3)
    end
    refute g.board[3][3].ship

    if s.check_place(g,col:0, row:0)
      s.place(g, col:0, row:0)
    end
    assert g.board[0][0].ship
  end

  def test_ships_cant_overlap
    g = Grid.new(5,5)
    s1 = Carrier.new
    s2 = Sub.new(true)

    s1.place(g, col:1, row:0)

    if s2.check_place(g, col:0, row:3)
      s2.place(g, col:0, row:3)
    end

    assert g.board[3][1].ship
    refute g.board[3][0].ship
    refute g.board[3][2].ship
  end

end




# class ShipsTests <Minitest::Test
  
#   def test_ships_know_their_length_and_direction
#     s = Ship.new 2
#     assert_equal s.length, 2
#     refute s.horizontal
#   end

#   def test_ships_can_be_placed
#     s = Ship.new 2, true
#     g = Grid.new (2,2)

#     s.place column: 1, row: 2


#   end
# end
# class GridTests < MiniTest::Test
#   def tests_it_can_make_a_grid
#     g = Grid.new (2,2)
#     assert 
#   end
# end



