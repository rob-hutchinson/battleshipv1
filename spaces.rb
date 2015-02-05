class Space
    
    attr_reader :ship, :shot, :empty

  def initialize 
    @ship = false
    @shot = false
  end

  def is_ship
    @ship = true
  end

  def shot_at
    @shot = true
  end
end