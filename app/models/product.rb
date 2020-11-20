class Product < ApplicationRecord
  belongs_to :user
  has_one :buyer
  has_one_attached :image

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :product_category
  belongs_to :product_condition
  belongs_to :delivery_fee
  belongs_to :prefecture
  belongs_to :arrival_date

  validates :product_name, :description, presence: true

  validates :product_category, :product_condition, :delivery_fee, :prefecture, :arrival_date, numericality: { other_than: 1 }

end
