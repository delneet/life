module Game
  class SquareAlive < Square
    def will_be_alive?
      neighbours == 2 || neighbours == 3        
    end
  end
end
