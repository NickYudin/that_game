class DiceRoller < ApplicationService

	def initialize (qty, face)
		@qty = qty
		@face = face
	end

	def call
		@result = 0
			@qty.times do
				@result += rand(1..@face)
			end
		return "#{@result}"
	end

end
