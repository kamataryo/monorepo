require 'Thor'

class MyCLI < Thor
  desc 'hello NAME', 'say hello to NAME'
  def hello name
    puts "Hello #{name}"
  end
  
  desc 'hello2 NAME', 'say hello to NAME twice'
  def hello2 name
    puts  "Hello #{name}"
    puts  "Hello #{name}"
  end
end
