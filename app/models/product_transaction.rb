class ProductTransaction
  include ActiveModel::Model

  attr_accessor :user_id, :product_id, :zip_code, :prefecture_id, :city, :address, :building, :phone_number, :order_id 
  validates :city, :address, :phone_number, presence: true

  with_options presence: true do
    validates :zip_code, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"}
    validates :phone_number, format: {with: /\A\d{10,11}\z/, message: "is invalid."}
  end

  def save
    Order.create(user_id: user_id, product_id: product_id)
    SendingDestination.create(zip_code: zip_code, city: city, address: address, building: building, phone_number: phone_number, order_id: order_id)
  end
end
