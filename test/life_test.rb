# frozen_string_literal: true

require 'test_helper'

module Life
  class GameTest < Minitest::Spec
    let(:height)     { 15 }
    let(:max_cycles) { 3 }
    let(:tick)       { 0.01 }
    let(:width)      { 15 }

    subject { Life::Game.new(width, height) }

    def test_it_runs
      refute_operator 0, :==, subject.run(tick, max_cycles)
    end

    def test_it_runs_only_specified_cycles
      assert_equal max_cycles, subject.run(tick, max_cycles)
    end
  end
end
