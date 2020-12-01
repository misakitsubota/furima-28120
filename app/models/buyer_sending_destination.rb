class BuyerSendingDestination
  include ActiveModel::Model
  attr_accessor :user_id, :product_id, :zip_code, :prefecture_id, :city, :address, :building, :phone_number, :buyer_id 

  validates :zipcode, :city, :adress, :phone_number, presence: true
  validates :building, null: true
  # 「住所」の郵便番号に関するバリデーション
  validates :zip_code, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"}

  def save
    SendingDestination.create()
end
