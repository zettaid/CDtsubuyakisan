class User < ApplicationRecord
	validates :zip_code, format: { with: /\A\d{3}\-?\d{4}\z/ }

	def self.search(search)
	    if search
	      User.where(['email LIKE ?', "%#{search}%"])
	    else
	      User.all
        end
    end
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
