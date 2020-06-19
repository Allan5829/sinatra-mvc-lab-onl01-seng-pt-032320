class PigLatinizer
  attr_accessor :input

  def initialize(input)
    @input = input.downcase
  end

  def latinizer
    suffix_ay = "ay"
    suffix_way = "way"

    letters_array = @input.split

    new_letters_array = check_if_vowel(letters_array)

    word = new_letters_array.join
    if @add_ay = true
      new_word = [word, suffix_ay].join
    else
      new_word = [word, suffix_way].join
    end

    new_word

  end

  def check_if_vowel(array)
    first_letter = array[0]
    if ["a", "e", "i", "o", "u"].any? { |letter| first_letter.include? letter}
      @add_ay = false
      return array
    else
      array.shift
      array << first_letter
      @add_ay = true
      check_if_vowel(array)
    end
  end

end

class TextAnalyzer
  attr_reader :text

  def initialize(text)
    @text = text.downcase
  end

  def count_of_words
    words = text.split(" ")
    words.count
  end

  def count_of_vowels
    text.scan(/[aeoui]/).count
  end

  def count_of_consonants
    text.scan(/[bcdfghjklmnpqrstvwxyz]/).count
  end

  def most_used_letter
    s1 = text.gsub(/[^a-z]/, '') # gets rid of spaces
    arr = s1.split('')
    arr1 = arr.uniq
    arr2 = {}

    arr1.map do |c|
      arr2[c] =  arr.count(c)
    end

    biggest = { arr2.keys.first => arr2.values.first }

    arr2.each do |key, value|
      if value > biggest.values.first
        biggest = {}
        biggest[key] = value
      end
    end

    biggest
  end
end
