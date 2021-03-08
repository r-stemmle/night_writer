require 'minitest/autorun'
require 'minitest/pride'
require './lib/night_reader'
require 'mocha/minitest'

class NightReaderTest < Minitest::Test

  def test_it_exists
    night_writer = NightReader.new("braille.txt", "original_message.txt")

    assert_instance_of NightReader, night_writer
  end

  def test_it_can_produce_message_as_array
    night_writer = NightReader.new("braille.txt", "original_message.txt")

    assert_equal Array, night_writer.message.class
  end

  def test_it_can_read_message_character_length
    night_writer = NightReader.new("braille.txt", "original_message.txt")
    night_writer.stubs(:read_message).returns("Hello")

    assert_equal 6, night_writer.character_count
  end

end
