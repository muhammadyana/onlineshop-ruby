class Order < ApplicationRecord
	has_many :liner_items, dependent: :destroy
	enum pay_type: {
		"Check"		=> 0,
		"Credit card" => 1,
		"Purchases order" => 2
	}
	validates :name, :address, :email, presence: true
  	validates :pay_type, inclusion: pay_types.keys

  	def add_liner_items_from_cart(cart)
  		cart.liner_items.each do |item|
  			item.cart_id = nil
  			liner_items << item
  		end
  	end
end
