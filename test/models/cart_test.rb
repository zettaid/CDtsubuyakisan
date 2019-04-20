require 'test_helper'

class CartTest < ActiveSupport::TestCase
	  belongs_to :user
	  belongs_to :history
	  has_many :orders, dependent: :destroy
end
