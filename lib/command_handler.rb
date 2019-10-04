require_relative "robot" 
class CommandHandler

	attr_accessor :robots,:robot_objs
	def start
		@robots = []
		puts "please provide the PLACE command"
		input = gets.chomp
		while input != "q"
			start_command(input.upcase)
			input =  gets.chomp
		end	
		puts "Exiting..."	
	end

	def start_command(input)
		input = input.split(" ")
		robot_name = input[0]
		command = input[1]
		# match_coord=/^\d+\s*,\s*\d+\s*,\s*(NORTH|SOUTH|EAST|WEST)$/
		case command
		when "PLACE"
			message  = 'unable to place the robot'
			if input[2].match(/^\d+\s*,\s*\d+\s*,\s*(NORTH|SOUTH|EAST|WEST)$/)
				coordinates = input[2].split(",")
				if coordinates.length == 3
					x = coordinates[0].to_i
					y = coordinates[1].to_i
					f = coordinates[2]
					if !is_robot_present?(robot_name)
						if !Robot.another_robot_in_place?(x,y)
							robot = Robot.new(x,y,f,robot_name) rescue nil
							if robot
								@robots.push(robot_name)
								message = "robot placed successfully , you can go with another operation"			
							else
								message = "coordinates are not correct"
							end
						else
							message = "robot will collide with another robot"
						end
					else
						message = "robot already exists"
					end
				end
			end
			puts message

		when "MOVE"
			if is_robot_present?(robot_name)
				puts Robot.robot_objs["#{robot_name}"].move
			else
				puts "robot not found"
			end
		when "RIGHT","LEFT"
			if is_robot_present?(robot_name)
				Robot.robot_objs["#{robot_name}"].turn(input) 
			else
				puts "robot_not_found"
			end
		when "REPORT"
			if is_robot_present?(robot_name)
				puts Robot.robot_objs["#{robot_name}"].report 
			else
				puts "robot_not_found"
			end
		else
			puts "invalid command"
		end
	end



	def operation_possible?
		puts "operation not possible" unless @robot
		@robot? true : false
	end
	def is_validate_place_command?(x,y,f)
		x.class==Integer && y.class==Integer &&["NORTH","SOUTH","EAST","WEST"].include?(f) ? true : false
	end

	def is_robot_present?(robot_name)
		@robots.each do |robot|
			if robot == robot_name
				return true
			end
		end
		return false
	end

end