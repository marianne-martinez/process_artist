

   	require 'ruby-processing'

class Firstsketch < Processing::App
	def setup
        background(225, 140, 0)
        stroke_weight(10)
	end 
	def draw
		if @size.nil? || @size ==333
			@size = 4
		else
			@size = @size +1
		end

		fill(220, 20, 60)
        rect(50, 50, @size, @size)

       
	end 
end

Firstsketch.new(:width => 800, :height => 800)