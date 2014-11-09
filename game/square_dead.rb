module Game
  class SquareDead < Square
    def will_be_alive?
      neighbours == 3
    end
  end
end
