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

  validates :image, :product_name, :description presence: true
  validates :cost, numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999, message: 'is out of setting range' }

  with_options presence: true do
    validates :cost, format: { with: /\A[0-9]+\z/, message: 'is invalid. Input half-width characters.' }
  end

  with_options numericality: { other_than: 1, message: 'Select' } do
    validates :product_category_id
    validates :product_condition_id
    validates :delivery_fee_id
    validates :prefecture_id
    validates :arrival_date_id
  end
end
