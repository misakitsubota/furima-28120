class Product < ApplicationRecord
  belongs_to :user
  has_one :buyer
  has_one_attached :image

  validates :image, presence: true

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :product_category
  belongs_to :product_condition
  belongs_to :delivery_fee
  belongs_to :prefecture
  belongs_to :arrival_date

  validates :product_name, :description, :cost, presence: true

  with_options numericality: { other_than: 1, message: 'Select' } do
    validates :product_category_id
    validates :product_condition_id
    validates :delivery_fee_id
    validates :prefecture_id
    validates :arrival_date_id
  end

end
