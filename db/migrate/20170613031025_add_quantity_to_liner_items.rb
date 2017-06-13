class AddQuantityToLinerItems < ActiveRecord::Migration[5.1]
  def change
    add_column :liner_items, :quantity, :integer, default: 1
  end
end
