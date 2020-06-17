require 'rest-client'
require 'json'
require 'pry'

'http://www.swapi.co/api/people/'

def get_from_api(query)
  response_string = RestClient.get( query)
  response_hash = JSON.parse(response_string)
end

def get_character_movies_from_api(character_name)
  characters = get_from_api('http://www.swapi.co/api/people/')
  films = []
  characters["results"].each do |character|
     if character["name"].downcase.split(' ').include?(character_name) ||  character["name"].downcase == character_name
    
       return film = character["films"]
       break
     end
   end
   films
end

def get_movies_detail_from_api(movie_name)
  movies = get_from_api('http://www.swapi.co/api/films/')
    details = 0
    movies["results"].each do |movie|
     if movie["title"].downcase == movie_name
       puts "~~~~~~~~Movie Info~~~~~~~"
       puts "Director: #{movie["director"]}"
       puts "Producer: #{movie["producer"]}"
       puts "Release Date: #{movie["release_date"]}"
       details = 1
     end
   end
   details
end

#get_character_movies_from_api("Luke")

def print_movies(films)
  # some iteration magic and puts out the movies in a nice list
  if !films.nil?
    film_names = []
    films.each do |film_title|
      film_names << get_from_api(film_title)["title"]
    end
    film_names.each_with_index do |title,number|
      puts "#{number + 1}: #{title}"
    end
  end
end

def show_character_movies(character)
  films = get_character_movies_from_api(character)
  print_movies(films)

end


## BONUS

# that `get_character_movies_from_api` method is probably pretty long. Does it do more than one job?
# can you split it up into helper methods?
