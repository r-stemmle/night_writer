require './lib/code_reader'

class NightReader < CodeReader

  def braille_to_english
    alpha_maker.english_printable(make_alpha_ready(incoming_message))
  end

  def print_english
    outbox.puts braille_to_english
  end

  def incoming_message
    inbox.readlines.map(&:chomp)
  end

  def make_alpha_ready(from_braille)
    loop_number = (from_braille.length / 3) - 2
    first_line = from_braille.slice!(0..2)
    loop_number.times do
      first_line = first_line.zip(from_braille.slice!(0..2)).map(&:join)
    end
    final = first_line.zip(from_braille).map(&:join)
    final
  end

  def character_count
    message.split.map(&:chomp).join.length
  end

end

inbox, outbox = ARGF.argv
night_reader = NightReader.new(inbox, outbox)
night_reader.print_english
puts night_reader.confirmation_message

# ruby ./lib/night_reader.rb braille.txt original_message.txt
