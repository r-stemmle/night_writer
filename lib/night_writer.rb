require './lib/braille_maker'

# import_file, export_file = ARGF.argv

class NightWriter

  attr_reader :import_file,
              :export_file

  def initialize(import_file, export_file)
    @import_file = import_file
    @export_file = export_file
  end

  def english_to_braille
    BrailleMaker.new.braille_printable(read_message)
  end

  def print_braille
    File.open(export_file_path, 'w') { |line| line.puts english_to_braille }
  end

  def message
    File.open(import_file_path)
  end

  def read_message
    message.read.chomp
  end

  def character_count
    read_message.length * 2
  end

  def confirmation_message
    "Created '#{export_file}' containing #{character_count} characters"
  end

  def import_file_path
    "./data/" + import_file
  end

  def export_file_path
    "./braille/" + export_file
  end

end

# night_writer = NightWriter.new(import_file, export_file)
# night_writer.print_braille
# puts night_writer.confirmation_message
