class Music < ApplicationRecord
	belongs_to :cd, optional: true
	validates :track, numericality: true
	validates :disk_number, numericality: true
end
