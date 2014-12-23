require 'require_all'
require_all "plugins/"


class PluginLoader

  def initialize(status=0)
    @status = status
  end

end

class Plugins

  def initialize() ; end

  def callplugin(command)
    command = command.downcase
    pluginlist = File.read("plugins.txt").split("\n")
    num = pluginlist.length
    i = 0
    until i > num do
      if command == pluginlist[i]
        system "clear" or system "cls"
        plugin = eval(pluginlist[i].capitalize).new.ui
        i += 1
        break
      else
        i += 1
      end
    end
  end
end

system "clear" or system "cls"
puts "Where should we start?"
puts "+++++++++++++++++++"
plugins = File.read("plugins.txt").split("\n")
puts plugins.map(&:capitalize)
puts "Optionally, you can also reload or exit."
command = gets.chomp
if command === "reload"
  Kernel.exec "ruby Artemis.rb"
elsif command === "exit"
  abort
else
  plugin = Plugins.new.callplugin(command)
end
