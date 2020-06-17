require 'rest-client'
require 'json'
require 'pry'

# iterate over the response hash to find the collection of `films` for the given
#   `character`
# collect those film API urls, make a web request to each URL to get the info
#  for that film
# return value of this method should be collection of info about each film.
#  i.e. an array of hashes in which each hash reps a given film
# this collection will be the argument given to `print_movies`
#  and that method will do some nice presentation stuff like puts out a list
#  of movies by title. Have a play around with the puts with other info about a given film.

def callClient(url)
  JSON.parse(RestClient.get(url))
end

# def get_character_movies(character_name)
#   response_string = RestClient.get("http://www.swapi.co/api/people/?search=#{character_name}")
#   response_hash = JSON.parse(response_string)
#
#   response_array = response_hash["results"]
#
#   response_array.each do |character_hash|
#     collection = []
#
#     if character_hash["name"].downcase == character_name
#       films_array = character_hash["films"]
#
#       films_array.each do |film_url|
#         response_film = RestClient.get(film_url)
#         film_hash = JSON.parse(response_film)
#
#         collection << film_hash
#       end
#     end
#
#     return collection
#   end
# end

def get_character_movies_from_api(character_name)
  response_hash = callClient("http://www.swapi.co/api/people/?search=#{character_name}")
  response_array = response_hash["results"]

  character_hash = response_array.find {|character| character["name"].downcase == character_name}
  character_hash["films"].collect {|film_url| callClient(film_url)}
end

def print_movies(films_array)
  films_array.each_with_index do |film_hash, i|
    position = i + 1
    puts "#{position}. #{film_hash["title"]}"
  end
end

def show_character_movies(character)
  films = get_character_movies_from_api(character)
  print_movies(films)
end

## BONUS

# that `get_character_movies_from_api` method is probably pretty long. Does it do more than one job?
# can you split it up into helper methods?
