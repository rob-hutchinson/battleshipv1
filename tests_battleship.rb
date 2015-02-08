require 'simplecov'
SimpleCov.start
require 'pry'

require 'minitest/autorun'
require './spaces'
require './grid'
require './ships'
require './player'


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
    assert g.board[2][0].dest
  end

  def test_ships_cant_be_placed_off_grid
    g = Grid.new(5,5)
    s1 = Batship.new
    s2 = Patrolboat.new(true)
    
    if s1.check_place(g, col: 3, row: 3)
      s1.place(g, col:3, row:3)
    end
    refute g.board[3][3].ship

    if s2.check_place(g,col:0, row:0)
      s2.place(g, col:0, row:0)
    end
    assert g.board[0][1].ship
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

  def test_subs_arent_destroyers
    g = Grid.new(5,5)
    s1 = Sub.new(true)

    s1.place(g, col:0, row:0)
    assert g.board[0][0].sub
    refute g.board[0][0].dest
  end

  def test_ships_know_theyre_hit
    g = Grid.new(5,5)
    s = Batship.new(true)

    s.place(g, col:0, row:0)
    row = 0
    col = 0
    4.times do |col|
      g.board[0][col].shot_at
      col += 1
    end

    col = 0
    4.times do |col|
      assert g.board[0][col].shot
      col += 1
    end
  end


end




