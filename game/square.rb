module Game
  class Square
    attr_accessor   :neighbours
    attr_reader     :x
    attr_reader     :y
    attr_reader     :alive
    
    def initialize(x,y, alive = false)
      self.x = x
      self.y = y
      self.alive = alive
    end
    
    def draw
    
    end
      
  end
end
