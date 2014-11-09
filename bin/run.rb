#! /usr/bin/env ruby

require_relative '../lib/game'
require 'curses'

Curses.noecho
Curses.init_screen
Curses.curs_set(0)

g = Thread.new { 
  game = Game::Game.new
  game.run  
}

g.join
