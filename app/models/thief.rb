class Thief
	attr_accessor :brains, :brawn, :heart
	attr_reader :name
	
	ALL = []

	def initialize(name)
		@name   = name
		@brains = 10 
		@brawn  = 10 
		@heart  = 10 
		ALL << self
	end

	def self.all 
		ALL 
	end 

end 