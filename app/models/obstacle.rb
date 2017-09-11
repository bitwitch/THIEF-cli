class Obstacle < ActiveRecord::Base
	has_many :solutions
	has_many :gadgets, through: :solutions
end
