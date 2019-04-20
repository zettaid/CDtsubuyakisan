class Music < ApplicationRecord
	belongs_to :cd, optional: true
end
