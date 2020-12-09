class Buyer < ApplicationRecord
  belongs_to :user
  belogns_to :product
  has_one :sending_destination

end
