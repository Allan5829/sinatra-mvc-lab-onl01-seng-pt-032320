require 'pry'
class PigLatinizer

  def piglatin(input)
    input_array = input.downcase.split(" ")
    output = []

    input_array.each do |i|
      output << latinizer(i)
    end

    output_array = output.join(" ")
    output_array

  end

  def piglatinize(old_word)
    suffix_ay = "ay"
    suffix_way = "way"

    letters_array = old_word.split("")

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
