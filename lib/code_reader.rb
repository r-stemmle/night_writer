

class CodeReader

  attr_reader :import_file,
              :export_file

  def initialize(import_file, export_file)
    @import_file = "./data/" + import_file
    @export_file = "./data/" + export_file
  end

  def message
    File.open(import_file)
  end

  def read_message
    message.read.chomp
  end

  def character_count
    message.first.chomp.length
  end

  def confirmation_message
    "Created '#{export_file_printable}' containing #{character_count} characters"
  end

  def export_file_printable
    export_file.delete_prefix("./data/")
  end

end
