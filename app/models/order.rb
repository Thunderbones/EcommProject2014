class Order < ActiveRecord::Base
  has_many :line_item
  belongs_to :user
end
