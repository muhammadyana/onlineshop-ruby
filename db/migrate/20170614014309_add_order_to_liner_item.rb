class AddOrderToLinerItem < ActiveRecord::Migration[5.1]
  def change
    add_reference :liner_items, :order, foreign_key: true
  end
end
