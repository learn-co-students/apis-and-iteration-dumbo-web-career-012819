def welcome
  puts "Hello Star Wars lover!!!"
end

def get_character_from_user
  puts "Please enter a character or the complete movie name."
  get_character_from_user = gets.chomp
  get_character_from_user.downcase
end
