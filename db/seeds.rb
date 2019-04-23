# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
# coding: utf-8

Cd.create(:id => 1, :artist_id => 1, :cd_name => 'ishizawa', :image_id => 1, :price => 1000,  :label_id => 1, :stock => 1, :genre_id => 1)
Order.create( :price => 1000, :cart_id => 1, :quantity => 1, :cd_id => 1)
user = User.new(:first_name => 'yusaku', :last_name => 'ishizawa', :email => 'a@a', :password => 'aaaaaa',:address =>'bunkyoku')
user.save!
Cart.create(:user_id =>1)