class User < ApplicationRecord
  has_many :cart
  has_many :review
end
