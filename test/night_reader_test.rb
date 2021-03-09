require './test/test_helper'

class NightReaderTest < Minitest::Test

  def test_it_exists
    night_reader = NightReader.new("braille.txt", "original_message.txt")

    assert_instance_of NightReader, night_reader
  end

  def test_it_can_produce_message_as_array
    night_reader = NightReader.new("braille.txt", "original_message.txt")

    assert_equal Array, night_reader.incoming_message.class
  end

  def test_it_can_read_message_character_length
    night_reader = NightReader.new("braille.txt", "original_message.txt")
    night_reader.stubs(:message).returns("0.0.\n0.0.\n0.0.")

    assert_equal 12, night_reader.character_count
  end

  def test_it_can_make_array_of_3_strings_always
    night_reader = NightReader.new("braille.txt", "original_message.txt")

    message  = ["0.0.", "0.0.", "0.0."]
    expected = ["0.0.", "0.0.", "0.0."]
    assert_equal expected, night_reader.make_alpha_ready(message)

    message = ["0.0.", "0.0.", "0.0.", "0.", "0.", "0."]
    expected = ["0.0.0.", "0.0.0.", "0.0.0."]
    assert_equal expected, night_reader.make_alpha_ready(message)

    message = ["0.0.", "0.0.", "0.0.", "0.", "0.", "0.", "0.", "0.", "0."]
    expected = ["0.0.0.0.", "0.0.0.0.", "0.0.0.0."]
    assert_equal expected, night_reader.make_alpha_ready(message)

    message = ["0.0.", "0.0.", "0.0.", "0.", "0.", "0.", "0.", "0.", "0.", "0.", "0.", "0."]
    expected = ["0.0.0.0.0.", "0.0.0.0.0.", "0.0.0.0.0."]
    assert_equal expected, night_reader.make_alpha_ready(message)
  end

end
