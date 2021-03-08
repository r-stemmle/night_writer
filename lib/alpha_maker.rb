require './data/braille_dictionary'

class AlphaMaker

  include BrailleDictionary

  attr_reader :dictionary

  def initialize
    @dictionary = english_to_braille.invert
    @phrase = []
  end

  def english_printable(input)
    get_braille_array(input)
    @phrase.map { |braille| get_alpha_letter(braille) }.join
  end

  def get_braille_array(input)
    alpha_counter = character_count(input) / 2
    index = 1
    while index < alpha_counter
      holder = []
      input.each do |braille|
        holder << braille.slice!(0..1)
      end
      @phrase << holder; index += 1
    end
    @phrase << input
  end

  def get_alpha_letter(input)
    dictionary[input]
  end

  def character_count(input)
    input.first.chomp.length
  end
end
