class RemoveNameFromLineItems < ActiveRecord::Migration
  def change
    remove_column :line_items, :name, :string
    remove_column :line_items, :price, :decimal
    remove_column :line_items, :description, :string
    remove_column :line_items, :slot, :string
    remove_column :line_items, :weight, :decimal
    remove_column :line_items, :quantity, :integer
  end
end
