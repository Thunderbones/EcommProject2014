class RemoveNameFromOrders < ActiveRecord::Migration
  def change
    remove_column :orders, :name, :string
    remove_column :orders, :address, :string
    remove_column :orders, :city, :string
    remove_column :orders, :country, :string
    remove_column :orders, :postal_code, :string
  end
end
