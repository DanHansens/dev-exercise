# frozen_string_literal: true

class WordFinder
  def find(letters)
    @max_word_length = letters.size
    contents = File.read('dictionary.json')
    dictionary = Kernel.eval(contents)
    chars = letters.split('')

    @letter_count = {}

    chars.each do |c|
      if @letter_count.key? c
        @letter_count[c] += 1
      else
        @letter_count[c] = 1
      end
    end

    matched_words = []
    dictionary.each do |word|
      matched_words << word if check_word(word)
    end

    matched_words
  end

  def check_word(word)
    return false if word.size > @max_word_length

    size = 0

    @letter_count.each do |letter, num|
      return false if word.count(letter) > num

      size += word.count(letter)
    end
    size >= word.size
  end
end
