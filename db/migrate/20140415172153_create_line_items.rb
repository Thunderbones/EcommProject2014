class CreateLineItems < ActiveRecord::Migration
  def change
    create_table :line_items do |t|
      t.string :name
      t.decimal :price
      t.string :description
      t.string :slot
      t.decimal :weight
      t.integer :quantity

      t.timestamps
    end
  end
end
