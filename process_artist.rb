
require 'ruby-processing'
# this is my first ruby processing project

class ProcessArtist < Processing::App
	def setup
        background(255, 140, 0)
        @size = 100
    end

    def draw
    	#create things
    end

    def key_pressed
    	warn "a key was pressed! #{key.inspect}"
    	if !key.is_a?(String)
            return
        end
        if key == "+"
            warn "You pressed plus"
            @size = @size + 100
        elsif key == "_"
            warn "You pressed minus"
            @size = @size - 100
        end 
        if @queue.nil?
    		@queue = ""
        end
    	if key != "\n"
    		@queue =@queue + key
    	else
    		warn "Time to run the command: #{@queue}"
    		run_command(@queue)
            @shape = @queue.chomp
    		@queue = ""
            new_shape = choose_shape_from_command(@queue)
    	end
    	if key == "z"
    		background(255, 140, 0)

    	end
    end
     def choose_shape_from_command(command)
        end 

    def run_command(command)
    	puts "Running Command #{command}"
    	if command.start_with?("b")
	    	formatted = command.slice(1, command.length - 1)
	    	puts formatted
	    	color = formatted.split(",")
	    	puts color
	    	background(color[0].to_i, color[1].to_i, color[2].to_i)
        end
	end

	def mouse_pressed
		warn "pressed"
		fill(255, 255, 255)
		oval(mouse_x, mouse_y, @size, @size)
	end

	def mouse_dragged
		warn "MouseX: #{mouse_x}, MouseY: #{mouse_y}"
		stroke(rand(255), rand(255), rand(255))
		fill(rand(255), rand(255), rand(255), rand(140))
        oval(mouse_x, mouse_y, @size, @size)
        
        case @shape
        when "oval" then oval(mouse_x, mouse_y, @size, @size)
        when "bigoval" then oval(mouse_x, mouse_y, @size * 2, @size * 2)
        when "rectangle" then rect(mouse_x, mouse_y, @size, @size)
        when "bigrectangle" then rect(mouse_x, mouse_y, @size * 2, @size *2)
        else 
            oval(mouse_x, mouse_y, 50, 60)
        end
	end

	def mouse_released
		warn "Released"
	end

	
end
   	ProcessArtist.new(:width => 800, :height => 800,
   		:title => "ProcessArtist", :full_screen => false)
