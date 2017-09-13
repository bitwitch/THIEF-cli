require_relative '../config/environment'

thief = Thief.new("Vince")

system "clear"
welcome 
display_museum 
context
enter_to_begin
system "clear"

display_museum
choose_gadgets
enter_num
select_five_gadgets 

system "clear"
entrypoint_description 
input = get_entrypoint
system "clear"
scaffolding_entry
current_obstacle = get_obstacle 

until obstacle_overcome?(current_obstacle)
	selection = select_gadget_for_obstacle 
	if selection.is_a?(String) && selection.downcase == "none"
		use_base_stats(thief, current_obstacle)
		break
	else 
		current_obstacle = find_working_gadget(selection) 
	end 
end 

enter_new_corridor(current_obstacle)
input = get_user_input 
artwork_left = Artwork.all.sample 
left_value = rand(10000..20000)
artwork_right = Artwork.all.sample
right_value = rand(10000..20000)

if input.downcase.split.include?("left")
	corridor_left(artwork_left, left_value)
elsif input.downcase.split.include?("right")
	corridor_right(artwork_right, right_value)
end 

until input.downcase.split.include?("forward")
	input = corridor_decision(artwork_left, left_value, artwork_right, right_value)
end 



