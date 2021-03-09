require './lib/code_reader'

class NightWriter < CodeReader

  def english_to_braille
    braille_maker.punch_braille(incoming_message)
  end

  def incoming_message
    inbox.read.chomp
  end

  def print_braille
    outbox.puts english_to_braille
  end

  def character_count
    message.chomp.length
  end

end

# inbox, outbox = ARGF.argv
# night_writer = NightWriter.new(inbox, outbox)
# night_writer.print_braille
# puts night_writer.confirmation_message

# ruby lib/night_writer.rb message.txt braille.txt
