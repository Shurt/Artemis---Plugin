require 'battlenet'

class Wow

  def initialize; end

  def ui

    puts "Hello, what kind of search are we running?"
    puts "1. Character Search."
    userInput = gets.chomp

    case userInput
    when "1"
      puts "Provide both the character name and realm"
      charInfo = gets.chomp
      charInfo = charInfo.split!(",")
      apicall = Battlenet.new :us, '97q5796agkgq5vs27qjd7et2z2w997sd', '3nvaa3ZvXEmmZttMgr4AWHau7EzFdX7N'
      apicall.character charInfo[1], charInfo[0]
      Kernel.exec "ruby Artemis.rb"
    else
      puts "Sorry!"
    end
  end
end
