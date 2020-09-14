# frozen_string_literal: true

module Life
  # Game master class.
  #
  # This class handles the time passing, ensures that the board is
  # properly displayed and setups the board seed
  class Game
    # Default limit of game cycles
    MAX_CYCLES = 1_000

    def initialize(width, height)
      @board = Life::Board.new(width, height)
    end

    # Run game
    #
    # @param  [Float]   tick Number of seconds to sleep between cycles
    # @param  [Integer] max_cycles Max number of cycles to run
    # @return [Integer] Life cycles passed
    def run(tick = 1, max_cycles = MAX_CYCLES)
      i = 0
      @board.seed

      loop do
        @board.apply_rules
        @board.apply_change
        system 'clear'
        printf "%<board>s\n\ncycle = %<cycle>d, alive cells = %<n>d",
               board: @board.display,
               cycle: i,
               n: @board.alive_cells
        i += 1
        break if i >= max_cycles

        sleep(tick)
      end

      i
    end
  end
end
