#!/usr/bin/env ruby

def display_top_menu
	puts "============================================="
	puts "== RUBY INTERACTIVE CALCULATOR (ric)       =="
	puts "============================================="
	puts "== Menu: (1) Basic  (2) Advanced  (Q) Quit =="
	puts "============================================="
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
	puts "       sqrt N1 N2 => N1 ** (1/N2)"
	print "ric:> "
end

def determine_operation(user_input)
	# First check to see if there was a mode change
	case user_input.downcase
	when '1'
		$mode = "basic"
	when '2'
		$mode = "advanced"
	end

	puts user_input.downcase
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
	else
		# Unknown key pressed
	end
	# Get user input
	user_input = gets.chomp
	# Determine operation
	determine_operation(user_input)
end



