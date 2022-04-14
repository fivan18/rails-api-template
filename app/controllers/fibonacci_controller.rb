class FibonacciController < ApplicationController
	def show
		begin
			render json: { fibonacci_value: fibonacci_value(fibonacci_position) }
		rescue ArgumentError, StandardError
			render json: { message:
				'Can\'t get fibonacci sequence from a negative integer or string' }, 
				status: :unprocessable_entity
		end
	end

	private

	def fibonacci_position
		Integer(params[:id])
	end

	def fibonacci_value(n)
		raise StandardError if n < 0

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
