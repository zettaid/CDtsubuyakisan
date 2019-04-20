class Cd < ApplicationRecord
  def self.search(search) #self.でクラスメソッドとしている
    if search # Controllerから渡されたパラメータが!= nilの場合は、titleカラムを部分一致検索
      Cd.where(['cd_name LIKE ?', "%#{search}%"])
    else
      Cd.all #全て表示。
    end
  end
	belongs_to :artists, optional: true
	belongs_to :labels, optional: true
	belongs_to :genres, optional: true
	has_many :musics, dependent: :destroy
  attachment :image
end
