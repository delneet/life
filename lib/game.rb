#! /usr/bin/env ruby

require_relative 'game/square'
require_relative 'game/square_alive'
require_relative 'game/square_dead'

require 'curses'
Curses.noecho
Curses.init_screen
Curses.curs_set(0)

module Game
  class Game
    attr_reader   :size
    attr_reader   :squares
    
    def initialize(size)
      @size  = size
      @squares = []
      seed
    end
    
    def seed    
      size.times do |x|
        size.times do |y|
          s = square.new(x,y)
          @squares << s
        end
      end        
    end
    
    def square
      rand(100) > 70 ? SquareAlive : SquareDead
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
end

game = Game::Game.new(10)
game.run
