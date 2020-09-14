# frozen_string_literal: true

require 'matrix'
require 'stringio'

module Life
  # Game of Life's Board.
  #
  # This class handles the communication with the cells
  #
  # **NOTE**: the caller **MUST** seed the instance before using it.
  class Board
    def initialize(width, height)
      @matrix = Matrix.build(height, width)
    end

    # Seed board
    #
    # Initialize each matrix cell as a [Life::Cell]
    #
    # @return [Matrix] New matrix

    # Matrix#each doesn't give the element directly as #each_with_index does.
    #
    # @see https://www.rubydoc.info/gems/matrix/0.3.0/Matrix#each-instance_method
    # @see https://www.rubydoc.info/gems/matrix/0.3.0/Matrix#each_with_index-instance_method
    # rubocop:disable Lint/RedundantWithIndex
    def seed
      @matrix = @matrix.each_with_index do |cell|
        x, y = *cell
        Life::Cell.new(x, y, self)
      end
    end
    # rubocop:enable Lint/RedundantWithIndex

    # Calculate next generation of all the cells
    def apply_rules
      @matrix.each(&:apply_rules!)
    end

    def apply_change
      @matrix.each(&:apply_change)
    end

    def alive_cells
      @matrix.select(&:alive?).count
    end

    # Screen printable format
    #
    # Add padding between horizontal cells for a better look

    def display
      to_s.split("\n")
          .map { |line| line.split('').join(' ') }
          .join("\n")
    end

    def to_s
      s = StringIO.new

      @matrix.to_a.each do |row|
        row.each { |c| s.write(c.to_s) }
        s.write("\n")
      end

      s.string
    end

    def at(x_pos, y_pos)
      @matrix[x_pos, y_pos]
    end
  end
end
