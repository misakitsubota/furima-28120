class BuyerSendingDestination < ApplicationRecord
  belongs_to :buyer 

  validates :zipcode, :city, :adress, :phone_number, presence: true
  validates :building, null: true
end
