require_relative '../config/environment'

display = Display.new 
thief = Thief.new("Vince")

welcome 
display_museum 
context
choose_gadgets
enter_num

# select 5 gadgets
until display.gadgets.length == 5 
	selection = get_user_input

	unless (1..9).to_a.include?(selection.to_i) 
		puts "That's not on the list, are you sure you're up for this?\n\n"
		enter_num
		next 
	end 

	gadget = Gadget.all[selection.to_i-1]
	if display.gadgets.include?(gadget)
		puts "You already have #{gadget.name}.\n\n"
	else 
		display.add_gadget(gadget) 
		puts "You selected: #{gadget.name}.\n\n"
	end  
	
	print "ENTER A NUMBER TO SELECT YOUR NEXT GADGET: "
end  
#

system "clear"
entrypoint_description 


