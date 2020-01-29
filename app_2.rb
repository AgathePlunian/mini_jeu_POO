require 'bundler'
require 'pry'
require_relative 'lib/game'
require_relative 'lib/player'

#-> Présentation du sommaire du projet 2.0
puts " --------------------------------------------------------"
puts "|\t  Bienvenue dans l'entre de la POO ->  \t\t |"
puts "|\t   La programmation orientée objet   \t\t |"
puts " --------------------------------------------------------"

puts "Entrer le nom de votre personnage !"
#-> Fin de présentation du sommaire du projet 2.0

#-> Récuration du nom du héro qui sera transmis à la class HumainPlayer
name = gets.chomp
name = name.to_s
#-> Création d'une instance de la class humainPlayer avec le nom récupérer 
player1 = HumanPlayer.new(name)

#-> Création d'un tableau contenant les énnemies qui vont être ajouter à la class Player
ennemie = []
ennemie << bots1 = Player.new("José")
ennemie << bots2 = Player.new("Josiane")

puts "----\t\t START FIGHT ! \t\t----"
#-> Initialisation de la boucle qui lance le jeu avec comme 'break' ->
# Si Heroe à 0 pv et Si Bots1 ou Bots2 est à 0 pv -> FIN 
while player1.life_points >= 0 && (bots1.life_points > 0 || bots2.life_points > 0)
  puts "Quelle action veux-tu effectuer ?
  a - chercher une meilleure arme
  s - chercher à se soigner 
  
  attaquer un joueur en vue :
  0 - Josiane a #{bots2.life_points} points de vie
  1 - José a #{bots1.life_points} points de vie"
  #--> Recupére le caractère inséré dans le terminal
  input = gets.chomp
  input = input.to_s
  #--> Recupére le caractère inséré dans le terminalet le transforme en string
  if input == "a"
    player1.search_weapon
  elsif input == "s"
    player1.search_health_pack
  elsif input == "0"
    if bots2.life_points > 0
      #--> Attaque seulement si le bot et encore en vie
      player1.attacks(bots2)
    else
      puts "--> #{bots2.name} est mort, vous ne pouvez plus l'attaquer"
    end
  elsif input == "1"
    if bots1.life_points > 0
      #--> Attaque seulement si le bot et encore en vie
      player1.attacks(bots1)
    else
      puts "--> #{bots2.name} est mort, vous ne pouvez plus l'attaquer"
    end
  elsif !(input == "a" &&  input == "s" && input == "0" && input == "1" )
    #--> Si autre caractères que "a s 0 ou 1, sort du programme"
    puts  "\t  Vous êtes sortie du programme"
    break
  end
  if bots1.life_points > 0 && bots2.life_points > 0
    #--> Les Ennemie attaque le Héros si Bots1 et 2 ont encore des pv
      ennemie.each do |bot|
        bot.attacks(player1) 
        puts " "
    end
  end
end

#--> Ajoute un commentaire poyr dire que les deux adversaires sont morts
if bots1.life_points <= 0 && bots2.life_points <= 0
  puts "Tes adversaires sont mort, bien joué !"
end


