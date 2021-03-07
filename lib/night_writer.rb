require './lib/braille'

import_file = ARGF.argv.first
export_file = ARGF.argv.last

class NightWriter

  attr_reader :import_file,
              :export_file

  def initialize(import_file, export_file)
    @import_file = import_file
    @export_file = export_file
  end

  def transform_to_braille
    Braille.new.braille_printable(read_message)
  end

  def make_braille
    File.open(export_file_path, 'w') { |line| line.puts transform_to_braille }
  end

  def message_file
    File.new(import_file_path)
  end

  def read_message
    message_file.read.chomp
  end

  def character_count
    read_message.length
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

#
# night_writer = NightWriter.new(import_file, export_file)
# night_writer.make_braille
# puts night_writer.confirmation_message
