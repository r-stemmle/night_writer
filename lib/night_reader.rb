require './lib/alpha_maker'
require './lib/code_reader'

class NightReader < CodeReader
  # def initialize(inbox, outbox, alpha_maker)
  #   @inbox = inbox
  #   @outbox = outbox
  #   @alpha_maker = alpha_maker
  # end

  def braille_to_english
    AlphaMaker.new.english_printable(make_alpha_ready(message))
  end

  def print_english
    File.open(export_file, 'w') { |line| line.puts braille_to_english }
  end

  def message
    braille = File.open(import_file)
    braille.readlines.map(&:chomp)
  end

  def make_alpha_ready(input)
    index = (input.length / 3) - 2
    first_line = input.slice!(0..2)
    index.times do
      first_line = first_line.zip(input.slice!(0..2)).map(&:join)
    end
    final = first_line.zip(input).map(&:join)
    final
  end

  def character_count
    make_alpha_ready(message).first.length
  end

end

# import_file, export_file = ARGF.argv
# night_reader = NightReader.new(import_file, export_file)
# night_reader.print_english
# puts night_reader.confirmation_message

# ruby ./lib/night_reader.rb braille.txt original_message.txt
