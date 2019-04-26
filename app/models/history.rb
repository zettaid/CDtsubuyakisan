class History < ApplicationRecord
	belongs_to :cart

	def total_price
		orders.to_a.sum{ |order| order.total_price}
	end

	def self.search(search)
		if search
			# 配列作成
			# @histories = []
			# Cdモデルのcd_nameを検索対象にする作業
			# @search = Cd.where(['cd_name LIKE ?', "%#{search}%"])
			@search = Cd.where(['cd_name LIKE ?', "%#{search}%"])
			# @search.orders.each do |order|
			# 	his = History.where(cart_id: order.cart_id)
			# 	@histories.push(his)
			# 	end
			# end
		else
			all
		end
	end

	enum status: { '未発送': 0, '発送準備中': 1, '発送済み': 2}

end

