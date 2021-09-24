# frozen_string_literal: true

class WordFinder
  def find(letters)
    @max_word_length = letters.size
    dictionary = Kernel.eval(File.read('dictionary.json'))

    parse_letters(letters)

    matched_words = []
    dictionary.each do |word|
      matched_words << word if validate_word(word)
    end

    matched_words
  end

  def validate_word(word)
    return false if word.size > @max_word_length

    found_letters = 0

    @letter_count.each do |letter, num|
      return false if word.count(letter) > num

      found_letters += word.count(letter)
    end
    found_letters == word.size
  end

  def parse_letters(letters)
    @letter_count = {}

    letters.split('').each do |c|
      if @letter_count.key? c
        @letter_count[c] += 1
      else
        @letter_count[c] = 1
      end
    end
  end
end
