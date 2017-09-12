def welcome 
	puts "THIEF: Milkmaid Heist\n\n"
end 

def display_museum
	url = "https://i.imgur.com/UPNE4Ox.jpg"
	a = AsciiArt.new(url)
	puts a.to_ascii_art(color: true)
end 

def context 
	puts "Amsterdam. 2005. The Rijksmuseum is undergoing major renovations. Giving you, Vince Peruggi, international art thief extraordinaire, a golden opportunity.\n\n"
end


def choose_gadgets
	puts "Select your gadgets:" 
	Gadget.all.each_with_index {|gadget, i| puts "#{i+1}. #{gadget.name}"}
	puts " "
end 

def enter_num 
	print "ENTER A NUMBER TO SELECT A GADGET: "
end 

def entrypoint_description
	string = "You find yourself standing in front of the illustrious Rijksmuseum. Its glorious facade towers before you. Your hair stands on end as you think about the invaluable masterpieces that lie within. Your adrenaline begins to surge, your body knows it is time for the heist. You examine the museum, assessing your entrypoints. "
	type(string)
	type("\nThere is SCAFFOLDING on the left end of the building giving access to third floor windows. ")
end 

def type(string)
	sentences = string.split(". ")
	sentences.each do |string|
		string.each_char do |c| 
			print c 
			sleep(0.025)
		end
		print "."
		sleep(0.025)
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
	string = "You head over to the scaffolding and start to ascend. The city lights of Amsterdam illuminate your path. An open window at the top gives easy access. You climb through the window landing on the hard parquet floor. "	
	type(string)
	puts "WAIT!!!"
end

def obstacle
	obstacle = Obstacle.all.sample
	while display.obstacles.include?(obstacle)
		obstacle = Obstacle.all.sample

	end
end







def get_user_input 
	gets.chomp
end 

