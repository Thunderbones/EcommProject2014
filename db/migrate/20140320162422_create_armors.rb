class CreateArmors < ActiveRecord::Migration
  def change
    create_table :armors do |t|
      t.integer :armorBonus
      t.integer :armorCheckPenalty
      t.integer :enhancementBonus
      t.boolean :masterwork

      t.timestamps
    end
  end
end
