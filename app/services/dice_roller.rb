class DiceRoller < ApplicationService


	def initialize (qty, face)
		@qty = qty
		@face = face
	end

	def call
		@result = 0
		@qty.times { @result += rand(1..@face) }
		@result
	end

end
