require 'rails_helper'

RSpec.describe ProductTransaction, type: :model do
  describe '商品購入情報の保存' do
    before do
      @product_transaction = FactoryBot.build(:product_transaction)
    end

    it 'すべての値が正しく入力されていれば保存できること' do
      expect(@product_transaction).to be_valid
    end
    it '郵便番号が空だと保存できないこと' do
      @product_transaction.zip_code = nil
      @product_transaction.valid?
      expect(@product_transaction.errors.full_messages).to include("Zip code can't be blank", "Zip code is invalid. Include hyphen(-)")
    end
    it '郵便番号にハイフンがなければ保存できないこと' do
      @product_transaction.zip_code = "1234567"
      @product_transaction.valid?
      expect(@product_transaction.errors.full_messages).to include("Zip code is invalid. Include hyphen(-)")
    end
    it '都道府県が１である場合保存できないこと' do
      @product_transaction.prefecture_id = 1
      @product_transaction.valid?
      expect(@product_transaction.errors.full_messages).to include("Prefecture Select")
    end
    it '市区町村がなければ保存できないこと' do
      @product_transaction.city = nil
      @product_transaction.valid?
      expect(@product_transaction.errors.full_messages).to include("City can't be blank")
    end
    it '番地がなければ保存できないこと' do
      @product_transaction.address = nil
      @product_transaction.valid?
      expect(@product_transaction.errors.full_messages).to include("Address can't be blank")
    end
    it '電話番号がなければ保存できないこと' do
      @product_transaction.phone_number = nil
      @product_transaction.valid?
      expect(@product_transaction.errors.full_messages).to include("Phone number can't be blank", "Phone number can't be blank", "Phone number is invalid.")
    end
    it '電話番号は半角数字でしか登録できないこと' do
      @product_transaction.phone_number = "０９０１２３４５６７８"
      @product_transaction.valid?
      expect(@product_transaction.errors.full_messages).to include("Phone number is invalid.")
    end
    it '電話番号にハイフンがあると登録できないこと' do
      @product_transaction.phone_number = "090-1234-5678"
      @product_transaction.valid?
      expect(@product_transaction.errors.full_messages).to include("Phone number is invalid.")
    end
    it '電話番号が11桁以上では登録できないこと' do
      @product_transaction.phone_number = "0901234567890"
      @product_transaction.valid?
      expect(@product_transaction.errors.full_messages).to include("Phone number is invalid.")
    end
  end

  
end