class User < ActiveRecord::Base
  has_many :order
  validate :name, :address, :city, :country, :postal_code, presence: true
end
