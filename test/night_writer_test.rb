require './test/test_helper'


class NightWriterTest < Minitest::Test

  def test_it_exists
    night_writer = NightWriter.new("message.txt", "braille.txt")

    assert_instance_of NightWriter, night_writer
  end

  def test_it_can_read_incoming_message
    night_writer = NightWriter.new("message.txt", "braille.txt")

    assert_instance_of String, night_writer.incoming_message
  end

  def test_it_can_encode_english_to_braille
    night_writer = NightWriter.new("message.txt", "braille.txt")
    night_writer.stubs(:incoming_message).returns("a")

    assert_equal ["0.", "..", ".."], night_writer.english_to_braille
  end

  def test_it_can_print_braille
    night_writer = NightWriter.new("message.txt", "braille.txt")
    night_writer.stubs(:english_to_braille).returns(["0.", "..", ".."])
    
    refute night_writer.print_braille
  end


  def test_it_can_read_message_character_length
    night_writer = NightWriter.new("message.txt", "braille.txt")
    night_writer.stubs(:message).returns("hello\n")

    assert_equal 5, night_writer.character_count
  end

end
