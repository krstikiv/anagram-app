class Word < ActiveRecord::Base

 before_create :add_letters

  def add_letters
    characters = self.text.chars
      alphabetized_characters = characters.sort
      self.letters = alphabetized_characters.join
    end


  def self.find_anagrams(string)
    combinations = []
    # Convert word to an array of letters
    letters = string.downcase.split(//)

    # Create an array to store our anagrams
    anagrams = []

    # Loop through each letter in letters
    letters.each do |letter|
      # Select the remaining letters
      remaining = letters.select { |l| l != letter }

      # Create a new word by combining the letter + the remaining letters
      # Add new word to anagrams array
      anagrams << letter + remaining.join('')

      # Create a new word by combining the letter + the reverse of the remaining letters
      # Add new word to anagrams array
      anagrams << letter + reverse_letters(remaining).join('')
    end

    # Loop through anagram array to find words matching in dictionary. place words in new array.
    anagrams.each do |combo|
      if Word.find_by_text(combo).present?
        combinations << combo
      end
    end
    # Return anagrams array
    combinations
  end

  def self.reverse_letters(letters)
    # create a new array of 2 items
    length = letters.length
    reversed_letters = Array.new(length)

    # loop through letters and keep index
    letters.each_with_index do |letter, index|
      reversed_letters[length - index - 1] = letter
    end

    reversed_letters
  end

end
