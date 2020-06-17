#!/usr/bin/env ruby

require_relative "../lib/api_communicator.rb"
require_relative "../lib/command_line_interface.rb"

welcome
character_or_crawl = get_character_or_movie_from_user
show_character_movies(character_or_crawl)
get_movie_info(character_or_crawl)
#get_movie_crawl(character_or_crawl)