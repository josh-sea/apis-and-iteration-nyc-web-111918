def welcome
  # puts out a welcome message here!
  puts "Welcome to our Star Wars app."
end

def get_character_from_user
  puts "please enter a character name"
  input = gets.chomp.split(" ")
  input.map{|word|word.capitalize}.join(" ")
  # use gets to capture the user's input. This method should return that input, downcased.
end
