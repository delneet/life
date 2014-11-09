module Game
  class Square
    attr_accessor   :neighbours
    attr_reader     :row
    attr_reader     :col
    
    def initialize(row, col, alive = false)
      @row = row
      @col = col
      @alive = alive
    end
    
    def alive?
      @alive
    end
    
    def draw
      @alive = @alive ? [2,3].include?(neighbours) : neighbours == 3
      @alive ? "o" : " "
    end
          
  end
end
