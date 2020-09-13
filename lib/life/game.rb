# frozen_string_literal: true

class Life::Game
  def initialize(w, h)
    @board = Life::Board.new(w, h)
    @board.seed
    @board.display
  end

  def run(tick = 0.05)
    i = 0
    loop do
      @board.run_rules
      @board.apply_change
      @board.display
      printf "\ncycle = %d, alive cells = %d", i, @board.alive_cells
      i += 1
      sleep(tick)
    end
  end
end
