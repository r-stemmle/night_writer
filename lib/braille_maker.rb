require './data/braille_dictionary'

class BrailleMaker

include BrailleDictionary

  attr_reader :dictionary

  def initialize
    @dictionary  = english_to_braille
    @message = []
  end

  def braille_printable(text)
    line = []
    braille_array(text).each_with_index do |braille_letter, index|
      if line_full(index)
        @message += line
        line.clear
        line = braille_letter
      elsif index == 0
        line = braille_letter
      else
        line = line.zip(braille_letter).map(&:join)
      end
    end
    @message += line
  end

  def braille_array(word)
    dissected_words(word).map { |alpha| braille_letter(alpha) }
  end

  def dissected_words(word)
    word.chars
  end

  def braille_letter(alpha)
    dictionary[alpha]
  end

  def line_full(index)
    index % 40 == 0 && index != 0
  end

end
