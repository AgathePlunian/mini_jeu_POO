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

ennemie = []
ennemie << bots1 = Player.new("José")
ennemie << bots2 = Player.new("Josiane")

while player1.life_points >= 0 && (bots1.life_points > 0 || bots2.life_points > 0)
  puts "Quelle action veux-tu effectuer ?
  a - chercher une meilleure arme
  s - chercher à se soigner 
  
  attaquer un joueur en vue :
  0 - Josiane a #{bots2.life_points} points de vie
  1 - José a #{bots1.life_points} points de vie"
  input = gets.chomp
  input = input.to_s
  if input == "a"
    player1.search_weapon
  elsif input == "s"
    player1.search_health_pack
  elsif input ==  "0"
    if bots2.life_points > 0
      player1.attacks(bots2)
    else
      puts "#{bots2.name} est mort, vous ne pouvez plus l'attaquer"
    end
  elsif input == "1"
    if bots1.life_points > 0
      player1.attacks(bots1)
    else
      puts "#{bots2.name} est mort, vous ne pouvez plus l'attaquer"
    end
  elsif !(input == "a" &&  input == "s" && input == "0" && input == "1" )
    puts  "Vous êtes sortie du programme"
    break
  end
    if bots1.life_points > 0 && bots2.life_points > 0
      bots1.attacks(player1)
      bots2.attacks(player1)
      puts " "
  end
end

