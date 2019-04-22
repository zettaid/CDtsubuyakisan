class Cart < ApplicationRecord
	has_many :orders
	belongs_to :user
    belongs_to :history

	def add_cd(cd_id)
		current_order = orders.find_by_cd_id(cd_id)

		if current_order
			current_order.quantity += 1
		else
			current_order = orders.build(cd_id:cd_id)
		end
		current_order
	end

	def total_price
		orders.to_a.sum{ |order| order.total_price}
	end
end
