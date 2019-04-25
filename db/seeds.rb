# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
# coding: utf-8



User.create(:email => 'a@a', :first_name => '絶対', :last_name => 'D',:first_name_kana => 'ゼッタイ' , :last_name_kana => 'ディー', :post_number => '000-0000', :phone_number => '000-000-0000', :password => '111111', :address => '東京都新宿区', :admin => 'true' )