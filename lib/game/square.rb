module Game
  class Square
    attr_accessor   :neighbours
    attr_accessor   :lifetime
    attr_reader     :row
    attr_reader     :col
    
    def initialize(row, col, alive = false)
      @row = row
      @col = col
      @alive = alive
      @lifetime = 0
    end
    
    def alive?
      @alive
    end
    
    def draw
      @alive = @alive ? [2,3].include?(neighbours) : neighbours == 3
      @lifetime = @alive ? @lifetime + 1 : 0
      @alive ? char : " "
    end
    
    def char
      @lifetime > 5 ? "x" : "o"
    end
          
  end
end
