# frozen_string_literal: true

module Life

  def self.new_game(w = 30, h = 30, tick = 1)
    game = Game.new(w, h)
    game.run tick
  end

end

require_relative 'life/board'
require_relative 'life/cell'
require_relative 'life/game'
