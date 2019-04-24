class Review < ApplicationRecord
 attachment :image
 belongs_to :user
 belongs_to :cd
end
