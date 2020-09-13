# frozen_string_literal: true

class Life::Cell
  def initialize(x, y, board)
    @x = x
    @y = y
    @board = board
    @alive = [ false, true ].sample
  end

  def run_rules
    die!  if alive? and alive_neighbors > 2
    live! if alive? and [ 2, 3 ].include?(alive_neighbors)
    die!  if alive? and alive_neighbors > 3
    live! if dead?  and alive_neighbors == 3
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
        neighbor_x = @x + position_x
        neighbor_y = @y + position_y
        next if neighbor_x == @x && neighbor_y == @y # Skip itself
        next if neighbor_x < 0 || neighbor_y < 0 # Exclude out of bounds as Matrix will wrap
        neighbor = @board.at( neighbor_x, neighbor_y )
        next if neighbor.nil? # Exclude out of bounds
        neighbors << neighbor
      end
    end

    neighbors
  end

  def live!
    @pending_action = true
  end

  def die!
    @pending_action = false
  end
end
