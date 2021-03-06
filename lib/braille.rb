require 'json'

class Braille

  attr_reader :letters

  def initialize
    @letters  = {
      a: ["0.", "..", ".."],
      b: ["0.", "0.", ".."],
      c: ["00", "..", ".."]

    }
  end

  def print_braille_letter(input)
    letters[input]
  end

end
a = Braille.new

puts a.letters[:a]
puts a.letters[:b]

abc = ["0.0.00", "..0...", "......"]
puts abc
