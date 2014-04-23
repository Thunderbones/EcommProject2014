class User < ActiveRecord::Base
  has_many :order
  validates :name, :address, :city, :country, :postal_code, presence: true
end
