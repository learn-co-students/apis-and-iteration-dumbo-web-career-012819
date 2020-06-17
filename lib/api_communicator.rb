require 'rest-client'
require 'json'
require 'pry'

def get_char_api
  response_string = RestClient.get('http://www.swapi.co/api/people/').body
  response_hash = JSON.parse(response_string)
end

def get_character_movies_from_api(character_name)
  #make the web request
  
  # iterate over the response hash to find the collection of `films` for the given
  #   `character`
  film_array = []
  get_char_api["results"].each do |char_array|
    if char_array["name"].downcase == character_name
      char_array["films"].each do |film|
        film_url = RestClient.get(film).body
        film_data = JSON.parse(film_url)
        film_array << film_data
      end
    end
  end
  film_array
  # collect those film API urls, make a web request to each URL to get the info
  #  for that film
  # return value of this method should be collection of info about each film.
  #  i.e. an array of hashes in which each hash reps a given film
  # this collection will be the argument given to `print_movies`
  #  and that method will do some nice presentation stuff like puts out a list
  #  of movies by title. Have a play around with the puts with other info about a given film.
end

def print_movies(films)
  films.each_with_index do |film_array, index|
    puts "#{index + 1}. #{film_array["title"]}"
  end
end

def show_character_movies(character)
  films = get_character_movies_from_api(character)
  print_movies(films)
end

## BONUS

# that `get_character_movies_from_api` method is probably pretty long. Does it do more than one job?
# can you split it up into helper methods?


def get_film_api
  response_string = RestClient.get('http://www.swapi.co/api/films/').body
  response_hash = JSON.parse(response_string)
end

def get_movie_crawl(movie)
  get_film_api["results"].each do |film_array|
    if film_array["title"].downcase == movie
      puts "#{film_array["opening_crawl"]}"
    end
  end
end


# if film title == argument, return Episode #, director, release_date
# also can iterate through the characters to get character name

def get_movie_info(movie)
  get_film_api["results"].each do |film_array|
    if film_array["title"].downcase == movie
      puts "Title: #{film_array["title"]}"
      puts "Episode #: #{film_array["episode_id"]}"
      puts "Director: #{film_array["director"]}"
      puts "Release Date: #{film_array["release_date"]}"
      puts "Characters:"
      film_array["characters"].each_with_index do |char, index|
        char_url = RestClient.get(char).body
        char_data = JSON.parse(char_url)
        puts "#{index + 1}. #{char_data["name"]}"
      end
    end
  end
end









