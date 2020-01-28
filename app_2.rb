require 'pry'
require_relative 'lib/game'
require_relative 'lib/player'

puts " --------------------------------------------------------"
puts "|\t  Bienvenue dans l'entre de la POO  \t\t |"
puts " --------------------------------------------------------"

puts "Entrer le nom de votre personnage !"
name = gets.chomp
name = name.to_s
player1 = HumanPlayer.new(name)
#puts player1.class

ennemie = []
ennemie << bots1 = Player.new("José")
ennemie << bots2 = Player.new("Josiane")
puts ennemie.inspect


while player1.life_points >= 0 && (bots1.life_points > 0 || bots2.life_points > 0)

  player1.show_state


  
  ennemie.each do |bot|
    if bot.life_points > 0 && player1.life_points > 0
      bot.attacks(player1)
      puts " "
    end
    if bot.life_points > 0 && player1.life_points > 0
      player1.attacks(bot)
      puts " "
    end
  end
  
end