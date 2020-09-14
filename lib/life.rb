# frozen_string_literal: true

# Conway's Game of Life
#
# The Game of Life, also known simply as Life, is a cellular automaton devised
# by the British mathematician John Horton Conway in 1970. The "game" is a
# zero-player game, meaning that its evolution is determined by its initial
# state, requiring no further input. One interacts with the Game of Life by
# creating an initial configuration and observing how it evolves.
module Life
  def self.new_game(width = 30, height = 30, tick = 1)
    game = Game.new(width, height)
    game.run tick
  end
end

require_relative 'life/board'
require_relative 'life/cell'
require_relative 'life/game'
