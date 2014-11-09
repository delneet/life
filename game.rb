#! /usr/bin/env ruby

require 'curses'
Curses.noecho
Curses.init_screen
Curses.curs_set(0)

class Game
  attr_reader   :size
  attr_reader   :squares
  
  def initialize(size)
    @size  = size
    squares = []
    seed
  end
  
  def seed    
    size.times do |x|
      size.times do |y|
        s = square(x,y)
        squares << s
      end
    end        
  end
  
  def square(x,y)
    new rand(100) > 70 ? Game::SquareAlive : Game::SquareDead
  end

  def run
    while true do
      inspect_neighbours
      draw
    end
  end
  
  def inspect_neighbours
  
  end
  
  def draw
  
  end
  
end

game = Game.new(10)
game.run
