# frozen_string_literal: true
require 'test_helper'

class Life::BoardTest < Minitest::Spec
  let(:height) { 15 }
  let(:width)  { 15 }

  subject { Life::Board.new(width, height) }

  describe "#to_s" do
    before do
      subject.seed
    end

    def test_it_can_be_printed
      str = subject.to_s

      assert_equal height, str.split("\n").count
      assert_equal width,  str.split("\n").first.length
    end

    def test_display_format_is_wider
      refute_operator width, :==, subject.display.split("\n").first.length
    end
  end
end
