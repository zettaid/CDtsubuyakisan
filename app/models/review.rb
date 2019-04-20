class Review < ApplicationRecord
 attachment :image
 belongs_to :user
end
