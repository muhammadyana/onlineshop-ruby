class Cart < ApplicationRecord
	has_many :liner_items, dependent: :destroy
	
	def add_product(product)
		current_item = liner_items.find_by(product_id: product.id)
		if current_item
			current_item.quantity += 1
			else
				current_item = liner_items.build(product_id: product.id)
		end
		current_item
	end

	def total_price
		liner_items.to_a.sum { |item| item.total_price }
	end

	def num_of_cart
		liner_items.to_a.sum { |item| item.quantity }
	end
end
