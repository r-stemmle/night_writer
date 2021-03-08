require 'minitest/autorun'
require 'minitest/pride'
require './lib/alpha_maker'

class AlphaMakerTest < Minitest::Test

  def test_it_exists
    alpha_maker = AlphaMaker.new

    assert_instance_of AlphaMaker, alpha_maker
  end

  def test_alpha_maker_can_get_letter_from_braille
    alpha_maker = AlphaMaker.new

    assert_equal "l", alpha_maker.get_alpha_letter(["0.", "0.", "0."])
  end

  def test_it_can_find_character_count
    # skip
    alpha_maker = AlphaMaker.new
    input = ["0.0.0.", "......", "......"]

    assert_equal 6, alpha_maker.character_count(input)
  end

  def test_it_can_find_alpha_letter_with_braille_array
    # skip
    alpha_maker = AlphaMaker.new
    input = ["0.", "..", ".."]

    assert_equal "a", alpha_maker.get_alpha_letter(input)
  end

  def test_it_can_find_three_alpha_letters_with_braille_array
    # skip
    alpha_maker = AlphaMaker.new
    input = ["0.0.0.", "......", "......"]

    assert_equal "aaa", alpha_maker.english_printable(input)
  end


end
