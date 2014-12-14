require 'open-uri'
#require_relative '../Artemis.rb'

class Movierandomizer

  def initialize() ; end

  def randmovie(pasteURL)
    rawbaseURL = "http://pastebin.com/raw.php?i="
    pastecode = pasteURL.chomp[20, 28]
    rawsource = open(rawbaseURL + pastecode).read
    rawarray = rawsource.split("\n")
    randitem = rawarray[rand(rawarray.length)]
    puts "Your randomly selected movie is: " + randitem
  end

end

class Movie

  def initialize; end

  def ui

    puts "Hello, what would you like to do?"
    puts "1. Select a random movie from a list (Pastebin)."
    puts "2. Select a random movie from a local list."
    puts "3. Select a random movie from those provided"
    userInput = gets.chomp

    case userInput
    when "1"
      puts "Please provide a URL for the list."
      url = gets.chomp
      randommovie = Movierandomizer.new
      randommovie.randmovie(url)
      Kernel.exec "ruby Artemis.rb"
    when "2"
      localSource = File.read("plugins/movies.txt")
      localArray = localSource.split("\n")
      randLocal = localArray[rand(localArray.length)].to_s
      puts randLocal
      Kernel.exec "ruby Artemis.rb"
    when "3"
      puts "Please list each movie, separated by a comma"
      rawMovieList = gets.chomp
      movieList = rawMovieList.split(",")
      randMovie = movieList[rand(movieList.length)].to_s
      puts randMovie
      Kernel.exec "ruby Artemis.rb"
    else
      puts "Sorry, coming soon!"
    end
  end
end
