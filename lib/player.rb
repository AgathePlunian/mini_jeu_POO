require 'pry'

class Player
  attr_accessor :name, :life_points

  def initialize(name)
    @name = name
    @life_points = 10
  end

  def show_state 
    if self.class == Player
     	puts "#{@name} a #{@life_points} points de vie"
    else 
    	puts "#{@name} a #{@life_points} points de vie et a une arme de niveau #{@weapon_level}"
    end
  end

  def gets_damage(x)
    @life_points = @life_points - x
    if @life_points <= 0
	    puts "Le joueur #{@name} a été tué ! 💀💀💀 "
    end
  end

  def attacks(ennemy)
    puts "#{@name} attaque #{ennemy.name} ! 💥"
    num_damage = compute_damage
    puts "#{name} inflige #{num_damage} points de dommages à #{ennemy.name} ☄️!"
		ennemy.gets_damage(num_damage)
		puts "\n"
  end

  def compute_damage
	  return rand(1..6)
    end
  end

class HumanPlayer < Player
attr_accessor :weapon_level

	def initialize (name)
			@name = name
			@life_points = 100
			@weapon_level = 1
	end

	def compute_damage
			rand(1..6) * @weapon_level
	end

	def search_weapon
			found_level_weapon = rand(1..6)
			puts "#{@name} a trouvé une arme de niveau #{found_level_weapon}"
			if @weapon_level < found_level_weapon 
					@weapon_level = found_level_weapon
					puts "YOUHOU ! Elle est meilleure que son arme actuelle: il la prends ! -> 🦾\n"
			else 
					puts "CHIENNE DE VIE ! Elle n'est pas mieux que son arme actuelle la putain de sa mère ! -> 🖇\ "
			end
	end

	def search_health_pack
		found_health = rand(1..6)
		if found_health == 1
			puts "#{name} n'a rien trouvé...  -->🦴🦴"
		elsif found_health > 1 && found_health < 6
			@life_points += 50
			if @life_points > 100
				@life_points = 100
			end
		puts "Bravo, #{name} a trouvé un pack de +50 points de vie ! -->🍗🍗\n"
		elsif found_health == 6
				@life_points += 80
			if @life_points > 100
				@life_points = 100
		end
		puts "Waouuuuuuuw,  #{name} a trouvé un pack de +80 points de vie ! -->🍖🍖\n"
		end
   end
end

