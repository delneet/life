#! /usr/bin/env ruby

require_relative '../lib/game'

g = Thread.new { 
  game = Game::Game.new
  game.run  
}

g.join
