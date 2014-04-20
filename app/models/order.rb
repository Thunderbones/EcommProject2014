class Order < ActiveRecord::Base
  has_many :line_item
  belongs_to :user
  validate :user_id, :price, :status, presence: true
end
