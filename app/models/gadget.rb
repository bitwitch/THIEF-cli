class Gadget  < ActiveRecord::Base
	has_many :solutions
	has_many :obstacles, through: :solutions
end
