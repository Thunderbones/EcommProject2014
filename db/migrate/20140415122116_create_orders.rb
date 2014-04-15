class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.string :name
      t.string :address
      t.string :city
      t.string :country
      t.string :postal_code

      t.timestamps
    end
  end
end
