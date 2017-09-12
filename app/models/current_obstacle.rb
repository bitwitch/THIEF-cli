class CurrentObstacle
	attr_reader :id, :name
	attr_accessor :brains, :brawn, :heart
	
	ALL = []

	def initialize(id, name, brains, brawn, heart)
		@id = id
		@name = name
		@brains = brains
		@brawn = brawn
		@heart = heart
		ALL << self
	end

	def self.all 
		ALL 
	end 

	def formatted_name
		self.name.split("_").map(&:capitalize).join(" ")
	end 

end 


