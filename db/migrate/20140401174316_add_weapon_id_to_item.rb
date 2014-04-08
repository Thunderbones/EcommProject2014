class AddWeaponIdToItem < ActiveRecord::Migration
  def change
    add_column :items, :weapon, :id
  end
end
