class NightWriter

  attr_reader :import_file,
              :export_file

  def initialize(import_file, export_file)
    @import_file = import_file
    @export_file = export_file
  end

  #tested
  def import_file_path
    "./data/" + import_file
  end

  #not tested
  def export_file_path
    "./braille/" + export_file
  end

  def make_braille
    File.write(export_file_path, read_message)
  end

  def message_file
    message = File.new(import_file_path)
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

end

import_file = ARGF.argv.first
export_file = ARGF.argv.last

night_writer = NightWriter.new(import_file, export_file)
# puts night_writer.confirmation_message
