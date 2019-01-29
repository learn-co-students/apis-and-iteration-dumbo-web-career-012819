def welcome
  puts "Yo"
end

def get_character_or_movie_from_user
  puts "please enter a character name or movie"
  downcase_input = gets.chomp
  downcase_input.downcase
  # use gets to capture the user's input. This method should return that input, downcased.
end
