def welcome
  puts "Hello! Welcome!"
end

def get_character_from_user
  puts "please enter a character name"
  # use gets to capture the user's input. This method should return that input, downcased.
  character_name = gets.chomp
  character_name
  #binding.pry
end

def border
 puts "•••••••••••••••••••••••••••••••••"
end
