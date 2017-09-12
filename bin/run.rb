require_relative '../config/environment'

thief = Thief.new("Vince")

system "clear"
welcome 
display_museum 
context
choose_gadgets
enter_num
select_five_gadgets 

system "clear"
entrypoint_description 
input = get_entrypoint
system "clear"
scaffolding_entry
get_obstacle 
selection = select_gadget_for_obstacle 
current_obstacle = find_working_gadget(selection) 
obstacle_overcome?(current_obstacle)
puts obstacle_overcome?(current_obstacle)


