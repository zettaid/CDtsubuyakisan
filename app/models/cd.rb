class Cd < ApplicationRecord
  def self.search(search) #self.でクラスメソッドとしている
    if search # Controllerから渡されたパラメータが!= nilの場合は、titleカラムを部分一致検索
        Cd.where(deleated: 'false').where(['cd_name LIKE ?', "%#{search}%"])
    else
      Cd.where(deleated: 'false') #削除したもの以外全て表示。
    end
  end
  def self.genre_search(search) #self.でクラスメソッドとしている
    if search
      Cd.where(deleated: 'false').where(genre_id: search)
    else
      Cd.where(deleated: 'false') #削除したもの以外全て表示。
    end
  end
	belongs_to :artist, optional: true
	belongs_to :label, optional: true
	belongs_to :genre, optional: true
	has_many :musics, dependent: :destroy
  accepts_nested_attributes_for :musics, allow_destroy: true
  has_many :orders, dependent: :destroy
  has_many :reviews, dependent: :destroy
  attachment :image
end