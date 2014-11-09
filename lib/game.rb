require_relative 'game/square'

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
      rand(100) > 80
    end

    def run
      while true do
        inspect_neighbours
        draw
        #sleep(0.1)
      end
    end
    
    def inspect_neighbours
      @grid.each do |square|  
        alive_neighbours = 0
        surrounding_rows(square).each do |row|
          surrounding_cols(square).each do |col|
            next if (square.row == row && square.col == col)
            alive_neighbours += 1 if @grid[row, col].alive?
          end
        end
        square.neighbours = alive_neighbours
      end
    end
    
    def surrounding_rows(square)
      (square.row-1..square.row+1).to_a.reject{|i| i<0 || i>@rows-1}
    end
    
    def surrounding_cols(square)
      (square.col-1..square.col+1).to_a.reject{|i| i<0 || i>@cols-1}
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
