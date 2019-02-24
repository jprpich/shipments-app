class Order < ApplicationRecord 
  validates :number, :tracking_number, :address, :delivered_at, :shipped_at, presence: true 
  belongs_to :vendor
  belongs_to :location

  scope :by_number, -> (number) { where('number LIKE ?', "%#{number}%") }
  scope :by_address, -> (address) { where('lower(address) LIKE ?', "%#{address}%") }
  scope :by_vendor, -> (vendor_id) { where('vendor_id = ?', vendor_id)}
end