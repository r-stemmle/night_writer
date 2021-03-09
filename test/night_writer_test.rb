require './test/test_helper'


class NightWriterTest < Minitest::Test

  def test_it_exists
    night_writer = NightWriter.new("message.txt", "braille.txt")

    assert_instance_of NightWriter, night_writer
  end

  def test_it_can_read_message_character_length
    night_writer = NightWriter.new("message.txt", "braille.txt")
    night_writer.stubs(:message).returns("hello\n")

    assert_equal 5, night_writer.character_count
  end

end
