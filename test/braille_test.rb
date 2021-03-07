require 'minitest/autorun'
require 'minitest/pride'
require './lib/braille'

class BrailleTest < Minitest::Test

  def test_it_exists
    letter = Braille.new

    assert_instance_of Braille, letter
  end

  def test_it_has_attributes
    braille = Braille.new

    assert_equal ["0.", "0.", "00"], braille.letters["v"]
  end

  def test_it_views_entries_as_arrays
    braille = Braille.new
    entry = "ryan"

    assert_equal ["r", "y", "a", "n"], braille.dissected_words(entry)
  end

  def test_it_can_make_a_braille_letter
    letter = Braille.new
    alpha = "a"
    expected =
    ["0.",
    "..",
    ".."]
    assert_equal expected, letter.braille_letter(alpha)
  end

  def test_it_can_make_a_braille_array
    braille = Braille.new
    word = "cab"
    expected = [["00", "..", ".."], ["0.", "..", ".."], ["0.", "0.", ".."]]
    assert_equal expected, braille.braille_array(word)
  end

  def test_it_can_make_braille_printable
    braille = Braille.new
    word = "cab"
    expected =
    [ "000.0.",
      "....0.",
      "......"]
    assert_equal expected, braille.braille_printable(word)
  end

  def test_it_can_make_braille_printable_sentence
    # skip
    braille = Braille.new
    word = "cab cab cab"
    expected =
    [ "000.0...000.0...000.0.",
      "....0.......0.......0.",
      "......................"]
    assert_equal expected, braille.braille_printable(word)
  end

  def test_it_can_wrap_sentence_at_40_chars
    # skip
    braille = Braille.new
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
