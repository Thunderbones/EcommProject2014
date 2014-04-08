class CreateEnhancements < ActiveRecord::Migration
  def change
    create_table :enhancements do |t|
      t.string :name
      t.integer :price
      t.text :description

      t.timestamps
    end
  end
end
