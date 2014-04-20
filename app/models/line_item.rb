class LineItem < ActiveRecord::Base
  belongs_to :order
  belongs_to :item
  validate :item_id, :order_id, presence: true
end
