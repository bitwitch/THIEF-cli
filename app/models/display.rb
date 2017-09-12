class Display
	
	GADGETS = [] 
	OBSTACLES = []

	def self.add_gadget(gadget) 
		GADGETS << gadget 
	end 

	def self.display_gadgets
		puts "\nYou are carrying: "
		GADGETS.each_with_index {|gadget, i| puts "#{i+1}. #{gadget.formatted_name}"}
	end 

	def self.add_obstacle(obstacle)
		OBSTACLES << obstacle
	end

	def self.obstacles 
		OBSTACLES 
	end 

	def self.gadgets 
		GADGETS
	end 

end 