def welcome
 puts "Hello!"
end

def get_character_from_user
  puts "Please enter a character name."
  user_input = gets.chomp
  # show_character_movies(user_input)
end
    # use gets to capture the user's input. This method should return that input, downcased
