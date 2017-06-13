class CombineItemsInCart < ActiveRecord::Migration[5.1]
  def change
  end
  def down
  	LinerItem.where("quantity>1").each do |liner_item|
  		#add individual items
  		liner_item.quantity.times do
  			LinerItem.create(
  				cart_id: liner_item.cart_id,
  				product_id: liner_item.product_id,
  				quantity: 1
  			)
  		end
  		liner_item.destroy
  	end
  end
end
