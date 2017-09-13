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

# FIRST OBSTACLE 
current_obstacle = get_obstacle 
unless any_gadget_solutions?(current_obstacle) && enough_base_stats?(thief, current_obstacle)
	game_over(current_obstacle)
	exit 
end 

until obstacle_overcome?(current_obstacle)
	used_base_stats = false 
	selection = select_gadget_for_obstacle 
	if selection.is_a?(String) && selection.downcase == "none"
		use_base_stats(thief, current_obstacle)
		overcome_using_base_stats
		used_base_stats = true
		break
	else 
		current_obstacle = find_working_gadget(selection) 
	end 
end 
overcome_obstacle(current_obstacle, selection) if used_base_stats == false 

sleep(1.5)
system "clear"

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
sleep(1.5)
system "clear"

# SECOND OBSTACLE
current_obstacle = get_obstacle 
unless any_gadget_solutions?(current_obstacle) && enough_base_stats?(thief, current_obstacle)
	game_over(current_obstacle)
	exit 
end 

until obstacle_overcome?(current_obstacle)
	used_base_stats = false 
	selection = select_gadget_for_obstacle 
	if selection.is_a?(String) && selection.downcase == "none"
		use_base_stats(thief, current_obstacle)
		overcome_using_base_stats
		used_base_stats = true
		break
	else 
		current_obstacle = find_working_gadget(selection) 
	end 
end 
overcome_obstacle(current_obstacle, selection) if used_base_stats == false 

sleep(1.5)
system "clear"

enter_new_corridor(current_obstacle)
input = get_user_input 
artwork_left = Artwork.all.sample 
left_value = rand(20000..30000)
artwork_right = Artwork.all.sample
right_value = rand(20000..30000)

if input.downcase.split.include?("left")
	corridor_left(artwork_left, left_value)
elsif input.downcase.split.include?("right")
	corridor_right(artwork_right, right_value)
end 

until input.downcase.split.include?("forward")
	input = corridor_decision(artwork_left, left_value, artwork_right, right_value)
end 
sleep(1.5)
system "clear"

# THIRD OBSTACLE 
current_obstacle = get_obstacle 
unless any_gadget_solutions?(current_obstacle) && enough_base_stats?(thief, current_obstacle)
	game_over(current_obstacle)
	exit 
end 

until obstacle_overcome?(current_obstacle)
	used_base_stats = false 
	selection = select_gadget_for_obstacle 
	if selection.is_a?(String) && selection.downcase == "none"
		use_base_stats(thief, current_obstacle)
		overcome_using_base_stats
		used_base_stats = true
		break
	else 
		current_obstacle = find_working_gadget(selection) 
	end 
end 
overcome_obstacle(current_obstacle, selection) if used_base_stats == false 

sleep(1.5)
system "clear"

enter_new_corridor(current_obstacle)
input = get_user_input 
artwork_left = Artwork.all.sample 
left_value = rand(20000..30000)
artwork_right = Artwork.all.sample
right_value = rand(20000..30000)

if input.downcase.split.include?("left")
	corridor_left(artwork_left, left_value)
elsif input.downcase.split.include?("right")
	corridor_right(artwork_right, right_value)
end 

until input.downcase.split.include?("forward")
	input = corridor_decision(artwork_left, left_value, artwork_right, right_value)
end 
sleep(1.5)
system "clear"

# FOURTH OBSTACLE 
current_obstacle = get_obstacle 
unless any_gadget_solutions?(current_obstacle) && enough_base_stats?(thief, current_obstacle)
	game_over(current_obstacle)
	exit 
end 

until obstacle_overcome?(current_obstacle)
	used_base_stats = false 
	selection = select_gadget_for_obstacle 
	if selection.is_a?(String) && selection.downcase == "none"
		use_base_stats(thief, current_obstacle)
		overcome_using_base_stats
		used_base_stats = true
		break
	else 
		current_obstacle = find_working_gadget(selection) 
	end 
end 
overcome_obstacle(current_obstacle, selection) if used_base_stats == false 

sleep(1.5)
system "clear"

enter_new_corridor(current_obstacle)
input = get_user_input 
artwork_left = Artwork.all.sample 
left_value = rand(20000..30000)
artwork_right = Artwork.all.sample
right_value = rand(20000..30000)

if input.downcase.split.include?("left")
	corridor_left(artwork_left, left_value)
elsif input.downcase.split.include?("right")
	corridor_right(artwork_right, right_value)
end 

until input.downcase.split.include?("forward")
	input = corridor_decision(artwork_left, left_value, artwork_right, right_value)
end 
sleep(1.5)
system "clear"

# FIFTH OBSTACLE 
current_obstacle = get_obstacle 
unless any_gadget_solutions?(current_obstacle) && enough_base_stats?(thief, current_obstacle)
	game_over(current_obstacle)
	exit 
end 

until obstacle_overcome?(current_obstacle)
	used_base_stats = false 
	selection = select_gadget_for_obstacle 
	if selection.is_a?(String) && selection.downcase == "none"
		use_base_stats(thief, current_obstacle)
		overcome_using_base_stats
		used_base_stats = true
		break
	else 
		current_obstacle = find_working_gadget(selection) 
	end 
end 
overcome_obstacle(current_obstacle, selection) if used_base_stats == false 

sleep(1.5)
system "clear"

###########
#MILKMAID HALLWAY

##############

enter_new_corridor(current_obstacle)
input = get_user_input 
artwork_left = Artwork.all.sample 
left_value = rand(20000..30000)
artwork_right = Artwork.all.sample
right_value = rand(20000..30000)

if input.downcase.split.include?("left")
	corridor_left(artwork_left, left_value)
elsif input.downcase.split.include?("right")
	corridor_right(artwork_right, right_value)
end 

until input.downcase.split.include?("forward")
	input = corridor_decision(artwork_left, left_value, artwork_right, right_value)
end 
sleep(1.5)
system "clear"






