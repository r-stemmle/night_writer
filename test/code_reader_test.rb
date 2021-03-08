require 'minitest/autorun'
require 'minitest/pride'
require './lib/code_reader'

class CodeReaderTest < Minitest::Test

  def test_it_exists
    night_writer = CodeReader.new("message.txt", "braille.txt")

    assert_instance_of CodeReader, night_writer
  end

  def test_it_can_find_import_file_path
    night_writer = CodeReader.new("message.txt", "braille.txt")

    assert_equal "./data/message.txt", night_writer.inbox_path
  end

  def test_it_can_find_export_file_path
    night_writer = CodeReader.new("message.txt", "braille.txt")

    assert_equal "./data/braille.txt", night_writer.outbox_path
  end

  def test_it_has_a_confirmation_message
    night_writer = CodeReader.new("message.txt", "braille.txt")
    expected = "Created 'braille.txt' containing 256 characters"
    night_writer.stubs(:character_count).returns(256)
    night_writer.stubs(:export_file).returns("braille.txt")

    assert_equal expected, night_writer.confirmation_message
  end

end
