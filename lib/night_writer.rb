
require './lib/code_reader'

class NightWriter < CodeReader

  def english_to_braille
    braille_maker.braille_printable(message)
  end

  def print_braille
    outbox.puts english_to_braille
  end

  def character_count
    message.length - 1
  end

end

# inbox, outbox = ARGF.argv
# night_writer = NightWriter.new(inbox, outbox)
# night_writer.print_braille
# puts night_writer.confirmation_message

# ruby lib/night_writer.rb message.txt braille.txt
