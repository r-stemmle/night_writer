require './lib/braille_maker'
require './lib/code_reader'

class NightWriter < CodeReader

  def english_to_braille
    BrailleMaker.new.braille_printable(read_message)
  end

  def print_braille
    File.open(export_file, 'w') { |line| line.puts english_to_braille }
  end

end
#
import_file, export_file = ARGF.argv
night_writer = NightWriter.new(import_file, export_file)
night_writer.print_braille
puts night_writer.confirmation_message

# ruby lib/night_writer.rb message.txt braille.txt
