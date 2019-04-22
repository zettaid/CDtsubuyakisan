class Order < ApplicationRecord
	belongs_to :cd
	belongs_to :cart

	def total_price
		cd.price * quantity
	end

end
