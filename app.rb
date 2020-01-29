require 'bundler'
require 'pry'
require_relative 'lib/game'
require_relative 'lib/player'

player1 = HumanPlayer.new("Petite_Crotte")
player2 = HumanPlayer.new("Coco")


puts "\n---- START FIGHT ! ----"
print "\n"    

while player1.life_points >= 0 && player2.life_points >= 0 do
    print " \n"
    puts "Voici l'état des joueurs:"
    player1.search_weapon
    player2.search_weapon
    player1.search_health_pack
    player2.search_health_pack
    player1.show_state
    player2.show_state
    player1.attacks(player2)
    if player2.life_points >= 0 
        player2.attacks(player1)
    end
    
end