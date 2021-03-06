require 'minitest/autorun'
require 'minitest/pride'
require './lib/braille'

class BrailleTest < Minitest::Test

  def test_it_exists
    letter = Braille.new

    assert_instance_of Braille, letter
  end

  def test_it_can_make_a_braille
    letter = Braille.new
    input = :a
    expected =
    ["0.",
    "..",
    ".."]
    assert_equal expected, letter.print_braille_letter(input)
  end
end
