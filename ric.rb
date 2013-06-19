#!/usr/bin/env ruby

def display_top_menu
	puts "======================================================="
	puts "== RUBY INTERACTIVE CALCULATOR (ric)                 =="
	puts "======================================================="
	puts "== Menu: (1) Basic  (2) Advanced  (3) Trip  (q) Quit =="
	puts "======================================================="
	puts "Mode: " + $mode.capitalize
end

def display_basic_menu
	puts "Usage:"
	puts " type: add N1 N2 => N1 + N2"
	puts "       sub N1 N2 => N1 - N2"
	puts "       mul N1 N2 => N1 * N2"
	puts "       div N1 N2 => N1 / N2"
	print "ric:> "
end

def display_advanced_menu
	puts "Usage:"
	puts " type: exp  N1 N2 => N1 ** N2"
	puts "       root N1 N2 => N1 ** (1/N2)"
	print "ric:> "
end

def trip_calc
	# Get values
	print "Distance - How far will you drive? "
	distance = gets.chomp.to_f
	print "MPG - What is the fuel efficiency of the car? "
	mpg = gets.chomp.to_f
	print "CPG - How much does gas cost per gallon? "
	cpg = gets.chomp.to_f
	print "Speed - How fast will you drive? "
	speed = gets.chomp.to_f
	# Calculations
	time = distance / speed
	cost = (distance / mpg) * cpg
	puts "======================================================="
	puts "== Your trip will take %g hours and cost $%g." % [time, cost]
	display_top_menu
end

def display_result(answer)
	puts "======================================================="
	puts "== >>> Result: %g " % answer.to_s
end

# Math display methods
def add(n1, n2)
	display_result(n1.to_f + n2.to_f)
end

def sub(n1, n2)
	display_result(n1.to_f - n2.to_f)
end

def mul(n1, n2)
	display_result(n1.to_f * n2.to_f)
end

def div(n1, n2)
	display_result(n1.to_f / n2.to_f)
end

def exp(n1, n2)
	display_result(n1.to_f ** n2.to_f)
end

def root(n1, n2)
	display_result(n1.to_f ** (1/n2.to_f))
end

def determine_mode(user_input)
	case user_input.downcase
	when '1'
		$mode = "basic"
	when '2'
		$mode = "advanced"
	when '3'
		$mode = "trip"
	when 'q'
	end
end

def determine_operation(user_input)
	oper_values = user_input.downcase.split
	# puts oper_values
	operation = oper_values[0]
	value1 = oper_values[1]
	value2 = oper_values[2]
	
	case operation
	when 'add'
		add(value1, value2)
	when 'sub'
		sub(value1, value2)
	when 'mul'
		mul(value1, value2)
	when 'div'
		div(value1, value2)
	when 'exp'
		exp(value1, value2)
	when 'root'
		root(value1, value2)
	when 'q'
	when '1'
	when '2'
	when '3'
	else
		puts "Unknown operation, or operation unnspecified.  Please try again"
	end

end

### START ###
# Initialize Usesr Input to empty string
user_input = ""
$mode = "basic"  # Assume initial mode is basic
# Main loop
until user_input.downcase == "q" do
	# Display top menu
	display_top_menu
	# Menu logic
	case $mode
	when 'basic' then
		display_basic_menu
	when 'advanced' then
		display_advanced_menu
	when 'trip' then
		trip_calc
	else
		# Unknown key pressed
	end
	# Get user input
	user_input = gets.chomp
	# First check to see if there was a mode change
	determine_mode(user_input)
	# Determine operation
	determine_operation(user_input)
end



