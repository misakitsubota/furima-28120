class Order
  include ActiveModel::Model
  attr_accessor :user_id, :product_id, :zip_code, :prefecture_id, :city, :address, :building, :phone_number, :buyer_id 

  validates :city, :adress, :phone_number, presence: true
  validates :building, null: true

  with_options presence: true do
    validates :zip_code, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"}
    validates :phone_number, format: {with: /\A\d{10,11}\z/, message: "is invalid."}
  end

  def save
    Buyer.create(user_id: user.id, product_id: product.id)
    SendingDestination.create(zip_code: zip_code, city: city, adress: adress, buinlding: building, phone_number: phone_number, buyer_id: buyer.id)
  end
end