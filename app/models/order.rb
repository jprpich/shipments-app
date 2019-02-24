class Order < ApplicationRecord 
  validates :number, :tracking_number, :address, :delivered_at, :shipped_at, presence: true 
  belongs_to :vendor
  belongs_to :location

end