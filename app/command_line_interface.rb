def welcome 
	puts "THIEF: Milkmaid Heist\n\n"
end 

def display_museum
	url = "https://i.imgur.com/UPNE4Ox.jpg"
	a = AsciiArt.new(url)
	puts a.to_ascii_art(color: true)
end 

def context 
	string = "Amsterdam. 2005. The Rijksmuseum is undergoing major renovations. Giving you, Vince Peruggi, international art thief extraordinaire, a golden opportunity.\n\n"
	string.each_char do |c| 
		print c 
		sleep(0.030)
	end
	puts " "
	"Prepare for: ".each_char do |c| 
			print c 
			sleep(0.035)
		end
	"THE MILKMAID HIEST\n".each_char do |c| 
		print c 
		sleep(0.12)
	end 
end

def enter_to_begin 
	msg = "PRESS ENTER TO BEGIN"

	100.times do
	  print "\r#{ msg }"
	  sleep 0.5
	  print "\r#{ ' ' * msg.size }" # Send return and however many spaces are needed.
	  begin
 			Timeout::timeout(0.5) do
    	return if gets.chomp
  	end
		rescue Timeout::Error
		end
	end
end 

def choose_gadgets
	puts " "
	"Hiest preparation".each_char do |c| 
		print c 
		sleep(0.025)
	end 
	puts "\n-------------------------------------------"
	puts "Select your gadgets:" 
	Gadget.all.each_with_index {|gadget, i| puts "#{i+1}. #{gadget.formatted_name}"}
	puts "-------------------------------------------\n\n"
end 

def select_five_gadgets 
	until Display.gadgets.length == 5 
	selection = get_user_input

		unless (1..9).to_a.include?(selection.to_i) 
			puts "That's not on the list, are you sure you're up for this?\n\n"
			enter_num
			next 
		end 

		gadget = Gadget.all[selection.to_i-1]
		if Display.gadgets.include?(gadget)
			puts "You already have #{gadget.formatted_name}.\n\n"
		else 
			Display.add_gadget(gadget) 
			puts "You selected: #{gadget.formatted_name}.\n\n"
		end  
	
		print "ENTER A NUMBER TO SELECT YOUR NEXT GADGET: "
	end  
end 

def enter_num 
	print "ENTER A NUMBER TO SELECT A GADGET: "
end 

def entrypoint_description
	string = "You find yourself standing in front of the illustrious Rijksmuseum. Its glorious facade towers before you. Your hair stands on end as you think about the invaluable masterpieces that lie within. Your adrenaline begins to surge, your body knows it is time for the heist. You examine the museum, assessing your entrypoints."
	type(string)
	type("\nThere is SCAFFOLDING on the left end of the building giving access to third floor windows.")
end 

def type(string)
	sentences = string.split(".").compact
	sentences.each do |string|
		string.strip.each_char do |c| 
			print c 
			# sleep(0.025)     #######################
		end
		print "."
		# sleep(0.025)       #######################
		puts " "
	end	 
end

def get_entrypoint
	puts "\nWhat's your move?"
	input = get_user_input.downcase

	until input.split.include?("scaffolding")
		puts "Nope. But the SCAFFOLDING looks pretty promising.\n\n"
		puts "What's your move?"
		input = get_user_input.downcase
	end
	input
end

def scaffolding_entry 
	string = "You head over to the scaffolding and start to ascend. The city lights of Amsterdam illuminate your path. An open window at the top gives easy access. You climb through the window landing on the hard parquet floor."	
	type(string)
	sleep(0.5)
	puts "WAIT!!!"
	sleep(1)
end

def get_obstacle
	obstacle = Obstacle.all.sample
	while Display.obstacles.include?(obstacle)
		obstacle = Obstacle.all.sample 
	end
	Display.add_obstacle(obstacle)
	CurrentObstacle.new(obstacle.id, obstacle.name, obstacle.brains, obstacle.brawn, obstacle.heart)
	puts " "
	type(obstacle.description) 
	sleep(1)
	obstacle  
end

def select_gadget_for_obstacle 
	input = "poo"
	until valid?(input)
		puts "\nChoose a gadget to deal with this obstacle.\n"
		sleep(0.25)
		Display.display_gadgets 
		puts "\nENTER A NUMBER TO SELECT A GADGET"
		puts "or"
		print "ENTER 'NONE' TO RELY ON YOUR OWN SKILL: "
		input = get_user_input
	end 

	if input.downcase == "none"
		input.downcase
	else 
		Display.gadgets[input.to_i-1]
	end 
end 

def valid?(input) 
	if (1..5).to_a.include?(input.to_i)
		true 
	elsif input.downcase == "none"
		true 
	else 
		false 
	end 
end 

def find_working_gadget(selection)
	current_obstacle = CurrentObstacle.all.last
	current_obstacle_id = CurrentObstacle.all.last.id
	obstacle_solutions = Solution.all.select {|solution| solution.obstacle_id == current_obstacle_id}
	solution_gadget = obstacle_solutions.find {|solution| solution.gadget_id == selection.id}

	if solution_gadget != nil
		gadget = Gadget.find(solution_gadget.gadget_id)
		current_obstacle.brains -= gadget.brains
		current_obstacle.brawn -= gadget.brawn
		current_obstacle.heart -= gadget.heart
		puts "You used: #{gadget.formatted_name}.\n"
		Display.gadgets.delete(gadget) 
	else
		puts "That gadget can't be used here.\n"
		sleep(0.005)
	end

	  current_obstacle
end 

def use_base_stats(thief, obstacle)
	thief.brains -= obstacle.brains
	thief.brawn -= obstacle.brawn
	thief.heart -= obstacle.heart
end

def obstacle_overcome?(obstacle)
	obstacle.brains <= 0 && obstacle.brawn <= 0 && obstacle.heart <= 0 
end

def overcome_obstacle(obstacle, gadget)
	obstacle_solutions = Solution.all.select {|solution| solution.obstacle_id == obstacle.id}
	solution = obstacle_solutions.find {|solution| solution.gadget_id == gadget.id}
	solution.description
end 

def enter_new_corridor(current_obstacle)
	puts " "
	string = "Safely past the #{current_obstacle.formatted_name}, you enter a beautiful corridor. There is art to your LEFT and to your RIGHT. The corridor extends FORWARD."
	type(string)
	puts "\nWhat is your move?"
end

def corridor
	puts " "
	string = "You are standing in a beautiful corridor. There is art to your LEFT and to your RIGHT. The corridor extends FORWARD."
	type(string)
	puts "\nWhat is your move?"
end 

def corridor_decision(artwork_left, left_value, artwork_right, right_value)
	corridor 
	input = get_user_input
	if input.downcase.split.include?("left")
		corridor_left(artwork_left, left_value)
	elsif input.downcase.split.include?("right")
		corridor_right(artwork_right, right_value)
	elsif !input.downcase.split.include?("forward")
		corridor_invalid 
	end 
	input 
end 

def corridor_left(artwork_left, value)
	url = artwork_left.image_url
	a = AsciiArt.new(url)
	puts a.to_ascii_art(color: true, width: 60)
	puts "#{artwork_left.title}, #{artwork_left.artist}, #{artwork_left.date}"
	puts "Value: $#{value}"
end 

def corridor_right(artwork_right, value)
	url = artwork_right.image_url
	a = AsciiArt.new(url)
	puts a.to_ascii_art(color: true, width: 60)
	puts "#{artwork_right.title}, #{artwork_right.artist}, #{artwork_right.date}"
	puts "Value: $#{value}"
end 

def corridor_invalid
	puts "Nope. LEFT, RIGHT, and FORWARD seem like viable options."
end 

def get_user_input 
	gets.chomp
end 

