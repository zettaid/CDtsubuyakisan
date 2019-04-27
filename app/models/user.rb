class User < ApplicationRecord


  has_many :carts
  has_many :reviews


	def self.search(search)
	    if search
	      User.where(deleated: 'false').where(['first_name LIKE ? AND last_name LIKE ?', "%#{search}%", "%#{search}%"])
         else
	      User.where(deleated: 'false')
        end
    end
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

end
