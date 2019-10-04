class Robot
	XMAX = 5
	YMAX = 5
	TURN_RIGHT = {NORTH: "EAST", SOUTH: "WEST", EAST: "SOUTH", WEST: "NORTH"}
  TURN_LEFT = {NORTH: "WEST", SOUTH: "EAST", EAST: "NORTH", WEST: "SOUTH"}
  @@robot_objs=Hash.new
	attr_accessor :x,:y,:f
	def initialize(x_coord,y_coord,f,name)
		if !will_fall?(x_coord,y_coord,1)
			@x = x_coord
			@y = y_coord
			@f = f 
			@@robot_objs["#{name}"] = self
		else
			raise "not a right position to place the robot"
		end
	end
	
	def self.robot_objs
		@@robot_objs
	end

	def move
		_x = @x
		_y = @y
		if @f == "NORTH" && @y<YMAX-1
			_y += 1
		elsif @f == "SOUTH" && @y>0
			_y -= 1
		elsif @f == "EAST" && @x<XMAX-1
			_x +=1
		elsif @f == "WEST" && @x>0
			_x -= 1
		end
		if !Robot.another_robot_in_place?(_x,_y)
			@x = _x
			@y = _y
			return ""
		else
			return "this move either result the robot to a fall down or it will collide with another robot"
		end
	end
	
	def turn(direction)
		@f = direction == "RIGHT" ? TURN_RIGHT[@f.to_sym] : TURN_LEFT[@f.to_sym]
	end
	
	def report
		"#{@x},#{@y},#{@f}"
	end
	
	def will_fall?(x,y,boundary)
		x<0 || x>XMAX-boundary || y<0 || y>YMAX-boundary ? true : false 
	end

	def self.another_robot_in_place?(x,y)
		@@robot_objs.each do |name,obj|
			return true if obj.x == x && obj.y == y
		end
		return false 
	end

end