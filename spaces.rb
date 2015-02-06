class Space
    
    attr_reader :ship, :shot, :patrol, :sub, :batship, :dest, :carrier

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

  def is_patrol
    @patrol = true
  end

  def is_sub
    @sub = true
  end

  def is_batship
    @batship = true
  end

  def is_dest
    @dest = true
  end

  def is_carrier
    @carrier = true
  end

end