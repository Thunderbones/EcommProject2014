class LineItem < ActiveRecord::Base
  has_one :user
  has_one :order
end
