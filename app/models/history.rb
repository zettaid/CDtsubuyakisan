class History < ApplicationRecord
	has_one :cart

	def total_price
		orders.to_a.sum{ |order| order.total_price}
	end

end
