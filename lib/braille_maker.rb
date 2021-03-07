require './lib/braille_dictionary'
require 'json'

class BrailleMaker

include BrailleDictionary

  attr_reader :letters

  def initialize
    @letters  = english_to_braille
  end

  def braille_printable(text)
    holder = []; initial = []
    braille_array(text).each_with_index do |array, index|
      if index % 40 == 0 && index != 0
        holder += initial
        initial.clear
        initial = array
      elsif index == 0
        initial = array
      else
        initial = initial.zip(array).map(&:join)
      end
    end
    holder += initial
  end

  def braille_array(word)
    dissected_words(word).map { |alpha| braille_letter(alpha) }
  end

  def dissected_words(word)
    word.chars
  end

  def braille_letter(alpha)
    letters[alpha]
  end

end
