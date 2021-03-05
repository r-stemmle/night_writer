require 'minitest/autorun'
require 'minitest/pride'
require './lib/night_writer'
require 'mocha/minitest'

class NightWriterTest < Minitest::Test

  def test_it_exists
    night_writer = NightWriter.new
    night_writer.stubs(:new).returns()

    assert_instance_of NightWriter, night_writer
  end

  def test_it_has_a_confirmation_message
    night_writer = NightWriter.new
    night_writer.stubs(:new).returns()
    expected = "Created 'braille.txt' containing 256 characters"
    night_writer.stubs(:character_count).returns(256)

    assert_equal expected, night_writer.confirmation_message
  end

  def test_it_can_count_message_characters
    night_writer = NightWriter.new
    night_writer.stubs(:new).returns()

    assert_equal 256, night_writer.character_count
  end

end
