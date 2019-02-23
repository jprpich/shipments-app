class Order < ApplicationRecord 
  validates :number, :tracking_number, :address, presence: true 
  belongs_to :vendor





end