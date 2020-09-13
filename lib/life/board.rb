# frozen_string_literal: true
require 'matrix'

class Life::Board
  def initialize(w, h)
    @matrix = Matrix.build(h, w)
  end

  # Seed board
  #
  # Initialize each matrix cell as a [Life::Cell]
  #
  # @return [Matrix] New matrix

  def seed
    @matrix = @matrix.each_with_index do |cell, i|
      x, y = *cell
      Life::Cell.new(x, y, self)
    end
  end

  def run_rules
    @matrix.each(&:run_rules)
  end

  def apply_change
    @matrix.each(&:apply_change)
  end

  def alive_cells
    @matrix.select { |c| c.alive? }.count
  end

  def display
    system 'clear'
    @matrix.to_a.each do |row|
      puts row.map { |cell| cell }.join(' ')
    end
  end

  def at(x, y)
    @matrix[x, y]
  end
end
