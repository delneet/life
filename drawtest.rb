#! /usr/bin/env ruby

require 'curses'
Curses.noecho
Curses.init_screen

class Drawtest 

  def initialize
   @index = 0 
  end

  def run
    (1..10).each do
      @index += 1
      bla
      sleep(rand())
    end
  end

  def bla
    Curses.setpos @index, 0
    c = rand(100) > 50 ? "\u25A0" : "\u25A1"
    Curses.addstr("#{c} #{@index}")
    Curses.refresh
  end 

end

t = Drawtest.new
t.run
