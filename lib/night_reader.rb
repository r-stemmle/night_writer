require './lib/alpha_maker'
require './lib/code_reader'

class NightReader < CodeReader

  def braille_to_english
    #could we ask it to break up the message here if it is over 80 chars?
    AlphaMaker.new.english_printable(message)
  end

  def print_english
    File.open(export_file, 'w') { |line| line.puts braille_to_english }
  end

  def message
    braille = File.open(import_file)
    braille.readlines.map(&:chomp)
  end

  #a new method to sort the message and loop through the print_english method?

end

import_file, export_file = ARGF.argv
night_reader = NightReader.new(import_file, export_file)
night_reader.print_english
puts night_reader.confirmation_message

# ruby ./lib/night_reader.rb braille.txt original_message.txt
