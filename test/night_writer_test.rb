require 'minitest/autorun'
require 'minitest/pride'
require './lib/night_writer'
require 'mocha/minitest'

class NightWriterTest < Minitest::Test

  def test_it_exists
    night_writer = NightWriter.new("message.txt", "braille.txt")

    assert_instance_of NightWriter, night_writer
  end

  def test_it_has_a_confirmation_message
    night_writer = NightWriter.new("message.txt", "braille.txt")
    expected = "Created 'braille.txt' containing 256 characters"
    night_writer.stubs(:character_count).returns(256)
    night_writer.stubs(:export_file).returns("braille.txt")

    assert_equal expected, night_writer.confirmation_message
  end

  def test_it_can_create_export_file
    night_writer = NightWriter.new("message.txt", "braille.txt")

    assert_equal "braille.txt", night_writer.export_file
  end

  def test_it_can_find_import_file_path
    night_writer = NightWriter.new("message.txt", "braille.txt")

    assert_equal "./data/message.txt", night_writer.import_file_path
  end

  def test_it_can_find_export_file_path
    night_writer = NightWriter.new("message.txt", "braille.txt")

    assert_equal "./braille/braille.txt", night_writer.export_file_path
  end

  def test_it_can_produce_message_text_as_string
    night_writer = NightWriter.new("message.txt", "braille.txt")

    assert_equal String, night_writer.read_message.class
  end

  def test_it_can_read_message_character_length
    night_writer = NightWriter.new("message.txt", "braille.txt")
    night_writer.stubs(:read_message).returns("Hello")

    assert_equal 5, night_writer.character_count
  end

end
