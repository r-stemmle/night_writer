class NightWriter

  def character_count
    256
  end

  def confirmation_message
    "Created 'braille.txt' containing #{character_count} characters"
  end


end

ryan = NightWriter.new
puts ryan.confirmation_message
