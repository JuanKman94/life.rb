# frozen_string_literal: true

module Life
  # Invidual cell for the [Life::Board].
  #
  # Each cell is in one of two possible states, alive or dead.
  class Cell
    def initialize(x_pos, y_pos, board)
      @x = x_pos
      @y = y_pos
      @board = board
      @alive = [false, true].sample
      @pending_action = nil
    end

    # Calculate next generation of cell
    def apply_rules!
      die!  if alive? && alive_neighbors > 2
      live! if alive? && [2, 3].include?(alive_neighbors)
      die!  if alive? && alive_neighbors > 3
      live! if dead?  && alive_neighbors == 3
    end

    def apply_change
      @alive = @pending_action
    end

    def alive_neighbors
      neighbors.count(&:alive?)
    end

    def to_s
      alive? ? '#' : ' '
    end

    def alive?
      @alive
    end

    def dead?
      !alive?
    end

    private

    def neighbors
      neighbors = []
      positions = [-1, 0, 1]

      positions.each do |position_x|
        positions.each do |position_y|
          next unless valid_neighbor?(position_x, position_y)

          neighbors << @board.at(@x + position_x, @y + position_y)
        end
      end

      neighbors
    end

    def valid_neighbor?(x_pos, y_pos)
      is_valid = true
      neighbor_x = @x + x_pos
      neighbor_y = @y + y_pos

      # Skip itself
      is_valid = false if neighbor_x == @x && neighbor_y == @y

      # Exclude out of bounds as Matrix will wrap
      is_valid = false if neighbor_x.negative? || neighbor_y.negative?

      # Check for nil
      is_valid = false if @board.at(neighbor_x, neighbor_y).nil?

      is_valid
    end

    def live!
      @pending_action = true
    end

    def die!
      @pending_action = false
    end
  end
end
