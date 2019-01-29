require 'rest-client'
require 'json'
require 'pry'

# iterate over the response hash to find the collection of `films` for the given
#   `character`
# collect those film API urls, make a web request to each URL to get the info
#  for that film
# return value of this method should be collection of info about each film.s
#  i.e. an array of hashes in which each hash reps a given film
# this collection will be the argument given to `print_movies`
#  and that method will do some nice presentation stuff like puts out a list
#  of movies by title. Have a play around with the puts with other info about a given film.
def print_movies(films)
  #binding.pry
  films.each do |film|
    puts film["title"]
    #binding.pry
  end
end

def movie_info
    response_string = RestClient.get('http://www.swapi.co/api/people/')
    response_hash = JSON.parse(response_string)
    response_hash
    #binding.pry
end

def get_character_movies_from_api(character_name)
 movie_array_hash = []
   movie_info["results"].find do |info|
      if info["name"].downcase == character_name.downcase
         info["films"].map do |url|
         movie_array_hash << JSON.parse(RestClient.get(url))
        end
      end
   end
   print_movies(movie_array_hash)
end

def show_character_movies(character)
  films = get_character_movies_from_api(character)
  print_movies(films)
end



## BONUS

# that `get_character_movies_from_api` method is probably pretty long. Does it do more than one job?
# can you split it up into helper methods?
