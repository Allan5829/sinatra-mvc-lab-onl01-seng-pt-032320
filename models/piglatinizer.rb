require 'pry'
class PigLatinizer

  def piglatinize(input)
    input_array = input.split(" ")
    output = []

    input_array.each do |i|
      output << latinizer(i)
    end

    output_array = output.join(" ")
    output_array

  end

  def latinizer(old_word)
    suffix_ay = "ay"
    suffix_way = "way"
    @add_ay = false

    letters_array = old_word.split("")

    new_letters_array = check_if_vowel(letters_array)

    word = new_letters_array.join
    #binding.pry
    if @add_ay == true
      new_word = [word, suffix_ay].join
    elsif @add_ay == false
      new_word = [word, suffix_way].join
    end

    new_word

  end

  def check_if_vowel(array)
    first_letter = array[0]
    if ["a", "e", "i", "o", "u"].any? { |letter| first_letter.downcase.include? letter} == false
      array.shift
      array << first_letter
      @add_ay = true
      #binding.pry
      check_if_vowel(array)
    else
      return array
    end
  end

end
