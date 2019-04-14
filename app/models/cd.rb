class Cd < ApplicationRecord
	scope :search, (->(word) { where('artist.name LIKE ? OR cd_name LIKE ?',
                                   "%#{sanitize_sql_like(word)}%",
                                   "%#{sanitize_sql_like(word)}%") })
	has_many :artists
	has_many :labels
	has_many :genres
	has_many :musics, dependent: :destroy
end
