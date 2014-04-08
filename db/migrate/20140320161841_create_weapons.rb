class CreateWeapons < ActiveRecord::Migration
  def change
    create_table :weapons do |t|
      t.string :damage
      t.integer :enhancementBonus
      t.boolean :masterwork
      t.string :type
      
      t.timestamps
    end
  end
end
