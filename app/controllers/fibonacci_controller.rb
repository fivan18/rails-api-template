class FibonacciController < ApplicationController
	before_action :set_fibonacci_position, only: [:show]

	def show
		render json: { fibonacci_value: fibonacci_value(@fibonacci_position) }
	end

	private

	def set_fibonacci_position
		@fibonacci_position = params[:id].to_i
	end

	def fibonacci_value(n)
		a = 0
		b = 1
		if n == 0
			return a
		end

		i = 2
    	while i <= n do
			c = a + b
			a = b
			b = c

			i = i + 1
		end
    
		b
	end
end
