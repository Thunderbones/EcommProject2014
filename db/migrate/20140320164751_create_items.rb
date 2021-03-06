class CreateItems < ActiveRecord::Migration
  def change
    create_table :items do |t|
      t.string :name
      t.integer :price
      t.text :description
      t.string :slot
      t.decimal :weight

      t.timestamps
    end
  end
end
