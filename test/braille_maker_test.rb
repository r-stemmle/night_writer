require 'minitest/autorun'
require 'minitest/pride'
require './lib/braille_maker'

class BrailleMakerTest < Minitest::Test

  def test_it_exists
    letter = BrailleMaker.new

    assert_instance_of BrailleMaker, letter
  end

  def test_it_has_attributes
    braille = BrailleMaker.new

    assert_equal ["0.", "0.", "00"], braille.dictionary["v"]
  end

  def test_it_views_entries_as_arrays
    braille = BrailleMaker.new
    entry = "ryan"

    assert_equal ["r", "y", "a", "n"], braille.dissected_words(entry)
  end

  def test_it_can_make_a_braille_letter
    letter = BrailleMaker.new
    alpha = "a"
    expected =
    ["0.",
    "..",
    ".."]
    assert_equal expected, letter.braille_letter(alpha)
  end

  def test_it_can_make_a_braille_array
    braille = BrailleMaker.new
    word = "cab"
    expected = [["00", "..", ".."], ["0.", "..", ".."], ["0.", "0.", ".."]]
    assert_equal expected, braille.braille_array(word)
  end

  def test_it_can_make_braille_printable
    braille = BrailleMaker.new
    word = "cab"
    expected =
    [ "000.0.",
      "....0.",
      "......"]
    assert_equal expected, braille.braille_printable(word)
  end

  def test_it_can_make_braille_printable_sentence
    # skip
    braille = BrailleMaker.new
    word = "cab cab cab"
    expected =
    [ "000.0...000.0...000.0.",
      "....0.......0.......0.",
      "......................"]
    assert_equal expected, braille.braille_printable(word)
  end

  def test_it_can_wrap_sentence_at_40_chars
    # skip
    braille = BrailleMaker.new
    word = "aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa"
    assert_equal 41, word.length
    expected = [
    "0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.",
    "................................................................................",
    "................................................................................",
    "0.", "..", ".."
    ]
    assert_equal expected, braille.braille_printable(word)
  end
end
