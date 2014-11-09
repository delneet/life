#! /usr/bin/env ruby

require_relative 'game/square'
require_relative 'game/square_alive'
require_relative 'game/square_dead'

require 'matrix'
require 'curses'
Curses.noecho
Curses.init_screen
Curses.curs_set(0)

module Game
  class Game
  
    def initialize
      @rows = Curses.lines
      @cols = Curses.cols
      @win = Curses::Window.new(@rows, @cols, 0, 0)
      @grid = Matrix.build(@rows, @cols){nil}
      seed
    end
    
    def seed    
      @rows.times do |row|
        @cols.times do |col|
          s = Square.new(row, col, alive)
          @grid.send :[]=, row, col, s
        end
      end        
    end
    
    def alive
      rand(100) > 50
    end

    def run
      while true do
        inspect_neighbours
        draw
        sleep(0.1)
      end
    end
    
    def inspect_neighbours
      @grid.each_with_index do |e, row, col|  
        alive_neighbours = 0
        (e.row-1..e.row+1).to_a.reject{|i| i<0 || i>@rows-1}.each do |grow|
          (e.col-1..e.col+1).to_a.reject{|i| i<0 || i>@cols-1}.each do |gcol|
            next if (e.row == grow && e.col == gcol)
            alive_neighbours += 1 if @grid[grow, gcol].alive?
          end
        end
        e.neighbours = alive_neighbours
      end
    end
        
    def draw
      @grid.each do |s| 
        @win.setpos s.row, s.col
        @win.addstr("#{s.draw}")
      end
      @win.refresh
    end
    
  end
end

game = Game::Game.new
game.run

