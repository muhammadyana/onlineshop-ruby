class LinerItem < ApplicationRecord
  belongs_to :order, optional: true
  belongs_to :product, optional: true
  belongs_to :cart
  def total_price
  	product.price * quantity
  end
  def up
  	Cart.all.each do |cart|
  		sums = cart.liner_items.group(:product_id).sum(:quantity)

  		sums.each do |product_id, quantity|
  			if quantity > 1
  				#remove individual items
  				cart.liner_items.where(product_id: product_id).delete_all
  				#replace with single item
  				item = cart.liner_items.build(product_id: product_id)
  				item.quantity = quantity
  				item.save!
  			end
  		end
  	end
  end
end
