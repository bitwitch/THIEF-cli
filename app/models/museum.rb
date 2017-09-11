class Museum
	attr_reader :name, :location

	ALL = []

	def initialize(name, location)
		@name = name
		ALL << self
	end

	def self.all
		ALL
	end

end
