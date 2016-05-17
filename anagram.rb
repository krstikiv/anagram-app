require_relative 'reverse_letters'

=begin
	def find_anagram(word)
  if word.length == 3
    word_array = word.split(//) # place the characters of the word into an array
    output_array = word_array.permutation.map{ |i| i.join } # joins the 3 character array with all permutations and inserts each into output array.

    return output_array
  else
    puts "Incorrect word length.  Please pass 3 letter word only."
  end
end
=end

def find_anagram(word)
  # Convert word to an array of letters
  letters = word.split(//)

  # Create an array to store our anagrams
  anagrams = []

  # Loop through each letter in letters
  letters.each do |letter|
    # Select the remaining letters
    remaining = letters.select { |item| item != letter}

    # Create a new word by combining the letter + the remaining letters
    # Add new word to anagrams array
    anagrams << letter + remaining.join('')

    # Create a new word by combining the letter + the reverse of the remaining letters
    # Add a new word to anagrams array
    anagrams << letter + reverse_letters(remaining).join('')
  end
  return anagrams
end

