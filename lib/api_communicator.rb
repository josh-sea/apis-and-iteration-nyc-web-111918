require 'rest-client'
require 'json'
require 'pry'

def get_character_movies_from_api(character_name)
    response_string = RestClient.get('http://www.swapi.co/api/people/')
    results = JSON.parse(response_string)
    array = []
    i = 1
    for i in 1..9
      response_string = RestClient.get("https://swapi.co/api/people/?page=#{i}")
      results = JSON.parse(response_string)
      array << results
    end
    found_results = array.map do |hash_page|
      hash_page["results"]
    end
    character_hash = found_results.flatten.find do |hash|
      hash["name"] == character_name
    end
      films_hash(character_hash)
end

def films_hash(argument)
films = argument["films"].map do |film|
    temp_film = RestClient.get(film)
    JSON.parse(temp_film)
  end
end

def print_movies(films)
  # some iteration magic and puts out the movies in a nice list
  i =0
  films.each do |film|
    i+=1
    puts "#{i}. #{film["title"]}"
  end
end

def show_character_movies(character)
  films = get_character_movies_from_api(character)
  print_movies(films)
end

## BONUS

# that `get_character_movies_from_api` method is probably pretty long. Does it do more than one job?
# can you split it up into helper methods?
