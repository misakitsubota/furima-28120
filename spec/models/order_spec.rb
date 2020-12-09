require 'rails_helper'

describe Order do
  before do
    @order = FactoryBot.build(:order)
  end

  describe '商品購入情報の登録' do
    context '情報が保存できる場合' do
      it '全ての値が正しく入力されれば保存できる' do
    
      end
    end

    context '商品の保存ができない場合' do
      it '画像がないと登録できない' do
      end
    end
  end
end
        