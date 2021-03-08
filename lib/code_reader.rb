require './lib/braille_maker'
require './lib/alpha_maker'

class CodeReader

  attr_reader :inbox,
              :outbox,
              :braille_maker,
              :alpha_maker

  def initialize(inbox, outbox)
    @inbox = inbox
    @outbox = File.new("./data/" + outbox, "w")
    @braille_maker = BrailleMaker.new
    @alpha_maker = AlphaMaker.new
  end

  def message
    File.open(inbox_path).read.chomp
  end

  def confirmation_message
    "Created '#{outbox_path.delete_prefix("./data/")}' containing #{character_count} characters"
  end

  def inbox_path
    "./data/" + inbox
  end

  def outbox_path
    outbox.path
  end

end
