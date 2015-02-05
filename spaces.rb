class Space
    
    attr_reader :ship, :shot

  def initialize 
    @ship = false
    @shot = false
  end

  def is_ship
    @ship = true
  end

  def check
    if @ship
      @shot = true
    end
  end
end