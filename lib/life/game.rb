# frozen_string_literal: true

class Life::Game
  def initialize(w, h)
    @board = Life::Board.new(w, h)
  end

  def run(tick = 0.05)
    i = 0
    @board.seed

    loop do
      @board.run_rules
      @board.apply_change
      system 'clear'
      puts @board.display
      printf "\ncycle = %d, alive cells = %d", i, @board.alive_cells
      i += 1
      sleep(tick)
    end
  end
end
