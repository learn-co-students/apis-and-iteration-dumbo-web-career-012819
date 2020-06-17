#!/usr/bin/env ruby.

require_relative "../lib/api_communicator.rb"
require_relative "../lib/command_line_interface.rb"

welcome
character = get_character_from_user
movie = show_character_movies(character)
details = get_movies_detail_from_api(character)

if movie.length == 0 && details != 1
  puts "Character or movie not found."
end
