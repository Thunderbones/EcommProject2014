class Item < ActiveRecord::Base
  belongs_to :category
  has_many :line_item
  validate :name, :price, :description, :slot, :weight, presence: true
end
