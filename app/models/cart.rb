class Cart < ApplicationRecord
	 has_many :orders, dependent: :destroy
	 belongs_to :user
	 belongs_to :history
end
