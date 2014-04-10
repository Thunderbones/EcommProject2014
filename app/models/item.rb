class Item < ActiveRecord::Base
  belongs_to :category
  validate :name, :price, :description, :slot, :weight, presence: true
end
