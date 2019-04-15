class Cd < ApplicationRecord
  def self.search(search) #self.でクラスメソッドとしている
    if search # Controllerから渡されたパラメータが!= nilの場合は、titleカラムを部分一致検索
      Cd.where(['name LIKE ?', "%#{search}%"])
    else
      Cd.all #全て表示。
    end
  end
	has_many :artists
	has_many :labels
	has_many :genres
	has_many :musics, dependent: :destroy
end
