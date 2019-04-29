# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
# coding: utf-8


User.create(:email => 'aa@aa', :first_name => '絶対', :last_name => 'D',:first_name_kana => 'ゼッタイ' , :last_name_kana => 'ディー', :post_number => '000-0000', :phone_number => '000-000-0000', :password => '111111', :address => '東京都新宿区', :admin => 'true' )
Cd.create(:artist_id => 1, :cd_name => 'ishizawa', :image_id => 1, :price => 1000,  :label_id => 1, :stock => 1, :genre_id => 1)
Cd.create(:artist_id => 1, :cd_name => 'zawa', :image_id => 1, :price => 2000,  :label_id => 1, :stock => 1, :genre_id => 1)
Artist.create(:name => 'ビリー・アイリッシュ')
Genre.create(:name => 'エレクトロポップ')
Label.create(:name => 'ダークルーム')

# Arthist.create(:)
# Cart.create(:user_id =>1)
# Order.create(:price => 1000, :cart_id => 3, :quantity => 1, :cd_id => 1)
# Order.create(:price => 2000, :cart_id => 4, :quantity => 2, :cd_id => 2)
# History.create(:cart_id => 1, :status => 0)





Shop.create(:name => '石井', :body => '長野のお店です', :master => '石井', :post_number => '111-1111', :address => '長野県', :phone_number => '000-000-0000', :email => 'ijijsijiji@kk' )

