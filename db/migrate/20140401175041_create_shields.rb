class CreateShields < ActiveRecord::Migration
  def change
    create_table :shields do |t|
      t.integer :armorBonus
      t.integer :armorCheckPenalty
      t.integer :enhancementBonus
      t.boolean :masterwork

      t.timestamps
    end
  end
end
