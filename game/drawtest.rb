#! /usr/bin/env ruby

require 'curses'
Curses.noecho
Curses.init_screen
Curses.curs_set(0)

class Drawtest 

  def initialize
    @index = 0 
    @win = Curses::Window.new(50,50,0,0)
  end

  def run
    while true do
      (0..9).each_with_index do |x|
        (0..9).each_with_index do |y|
          bla(x,y)
        end
      end
    end
  end

  def bla(x,y)
    @win.setpos y, x
    c = rand(100) > 50 ? "V" : "X" #"\u25A0" : "\u25A1"
    @win.addstr("#{c}")
    @win.refresh
  end 

end

t = Drawtest.new
t.run
