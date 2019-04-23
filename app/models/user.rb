class User < ApplicationRecord


  has_many :carts
  has_many :reviews


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
