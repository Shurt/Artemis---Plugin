require 'battlenet'

class Wow

  def initialize; end

  def ui

    puts "Hello, what kind of search are we running?"
    puts "1. Character Search."
    userInput = gets.chomp

    case userInput
    when "1"
      puts "Provide both the character name and realm, separated by a comma"
      charinfo = gets.chomp
      info = charinfo.split(",")
      apicall = Battlenet.new :us, 
      apicall.character 'Stormrage', 'Archisone'
      Kernel.exec "ruby Artemis.rb"
    else
      puts "Sorry!"
    end
  end
end


puts "This is a test"
