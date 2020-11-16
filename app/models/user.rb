class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :products
  # has_many :buyers


  NAME_REGEX = /\A[ぁ-んァ-ン一-龥]+\z/
  NAME_KANA_REGEX = /\A[ァ-ヶー－]+\z/
  PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i.freeze


  with_options presence: true, format: { with: NAME_REGEX, message: 'is invalid. input full-width characters.' } do
    validates :first_name
    validates :family_name
  end

  with_options presence: true, format: { with: NAME_KANA_REGEX, message: 'is invalid. input full-width katakana characters.' } do
    validates :first_name_kana
    validates :family_name_kana
  end

  with_options presence: true do
    validates :nickname
    validates :email
    validates :birth_day
  end

    validates :password, presence: true, length: { minimum: 6 }, format: { with: PASSWORD_REGEX, message: 'need to include both English letters and figures'}
  # validates_format_of :password, with: PASSWORD_REGEX, message: 'need to include both English letters and figures' 

end

