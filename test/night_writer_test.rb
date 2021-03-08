require 'minitest/autorun'
require 'minitest/pride'
require './lib/night_writer'
require 'mocha/minitest'

class NightWriterTest < Minitest::Test

  def test_it_exists
    night_writer = NightWriter.new("message.txt", "braille.txt")

    assert_instance_of NightWriter, night_writer
  end

  def test_it_can_produce_message_text_as_string
    night_writer = NightWriter.new("message.txt", "braille.txt")

    assert_equal String, night_writer.read_message.class
  end

  def test_it_can_read_message_character_length
    night_writer = NightWriter.new("message.txt", "braille.txt")
    night_writer.stubs(:read_message).returns("Hello")

    assert_equal 3, night_writer.character_count
  end

end
