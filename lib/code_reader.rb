require './lib/braille_maker'
require './lib/alpha_maker'

class CodeReader

  attr_reader :inbox,
              :outbox,
              :braille_maker,
              :alpha_maker,
              :message

  def initialize(inbox, outbox)
    @inbox = File.new("./data/" + inbox, "r")
    @outbox = File.new("./data/" + outbox, "w")
    @braille_maker = BrailleMaker.new
    @alpha_maker = AlphaMaker.new
    @message = File.open("./data/" + inbox).read
  end

  def confirmation_message
    "Created '#{outbox_path}' containing #{character_count} characters"
  end

  def inbox_path
    inbox.path.delete_prefix("./data/")
  end

  def outbox_path
    outbox.path.delete_prefix("./data/")
  end

end
