class Category < ActiveRecord::Base
  has_many :items
  validate :name, presence: true
end
