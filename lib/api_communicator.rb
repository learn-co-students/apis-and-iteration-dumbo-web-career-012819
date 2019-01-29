require 'rest-client'
require 'json'
require 'pry'

def get_character_movies_from_api(character_name)
  #make the web request
  response_string = RestClient.get('http://www.swapi.co/api/people/')
  response_hash = JSON.parse(response_string)

  film_array = []

  response_hash["results"].each do |character|
    if character["name"] == character_name
      character["films"].map do |url|
        film_string = RestClient.get(url)
        film_hash = JSON.parse(film_string)
        film_array << film_hash
      end
    end
    # binding.pry
  end
  film_array
end

def print_movies(films)
  # some iteration magic and puts out the movies in a nice list
  films.each do |element|
    puts "- #{element["title"]}"
  end

  #
  # films[0]['title'].each do |title|
  #   puts "#{title}"
#  binding.pry
end

def show_character_movies(character_name)
  films = get_character_movies_from_api(character_name)
#  binding.pry
  print_movies(films)
end

## BONUS

# that `get_character_movies_from_api` method is probably pretty long. Does it do more than one job?
# can you split it up into helper methods?
