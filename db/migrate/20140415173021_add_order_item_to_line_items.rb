class AddOrderItemToLineItems < ActiveRecord::Migration
  def change
    add_column :line_items, :item_id, :int
    add_column :line_items, :order_id, :int
  end
end
