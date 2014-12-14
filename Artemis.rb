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
    pluginlist = File.read("plugins.txt").split("\n")
    num = pluginlist.length
    i = 0
    until i > num do
      if command == pluginlist[i]
        system "clear" or system "cls"
        plugin = eval(pluginlist[i].capitalize).new.ui
        #system "clear" or system "cls"
        #plugin.ui
        i += 1
        break
      else
        i += 1
      end
    end
  end
end


puts "Command?"
command = gets.chomp
if command === "reload"
  Kernel.exec "ruby Artemis.rb"
elsif command === "exit"
  abort
else
  test = Plugins.new
  test.callplugin(command)
end
