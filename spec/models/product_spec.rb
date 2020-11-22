require 'rails_helper'

describe Product do
  before do
    @product = FactoryBot.build(:product)
  end

  describe '商品の保存' do
    context '商品が保存できる場合' do
      it '全ての値が正しく入力されれば登録できる' do
        expect(@product).to be_valid
      end
      it '価格が300円〜9999999円であれば登録できる' do
        @product.cost = 3000
        expect(@product).to be_valid
      end
    end

    context '商品の保存ができない場合' do
      it '画像がないと登録できない' do
        @product.image = nil
        @product.valid?
        expect(@product.errors.full_messages).to include("Image can't be blank")
      end
      it '商品名がないと登録できない' do
        @product.product_name = ''
        @product.valid?
        expect(@product.errors.full_messages).to include("Product name can't be blank")
      end
      it '商品の説明が空では登録できない登録できない' do
        @product.description = ''
        @product.valid?
        expect(@product.errors.full_messages).to include("Description can't be blank")
      end
      it 'カテゴリーの情報が１である場合は登録できない' do
        @product.product_category_id = 1
        @product.valid?
        expect(@product.errors.full_messages).to include('Product category Select')
      end
      it '商品の状態が１である場合は登録できない' do
        @product.product_condition_id = 1
        @product.valid?
        expect(@product.errors.full_messages).to include('Product condition Select')
      end
      it '配送料の負担が１である場合は登録できない' do
        @product.delivery_fee_id = 1
        @product.valid?
        expect(@product.errors.full_messages).to include('Delivery fee Select')
      end
      it '発送元の地域が１である場合は登録できない' do
        @product.prefecture_id = 1
        @product.valid?
        expect(@product.errors.full_messages).to include('Prefecture Select')
      end
      it '発送までの日数が１である場合は登録できない' do
        @product.arrival_date_id = 1
        @product.valid?
        expect(@product.errors.full_messages).to include('Arrival date Select')
      end
      it '価格についての情報がないと登録できない' do
        @product.cost = ''
        @product.valid?
        expect(@product.errors.full_messages).to include("Cost can't be blank")
      end
      it '価格の範囲が300円未満では登録できない' do
        @product.cost = 299
        @product.valid?
        expect(@product.errors.full_messages).to include('Cost is out of setting range')
      end
      it '価格の範囲が1000万円以上では登録できない' do
        @product.cost = 10_000_000
        @product.valid?
        expect(@product.errors.full_messages).to include('Cost is out of setting range')
      end
      it '販売価格が半角でないと登録できない' do
        @product.cost = '１０００００'
        @product.valid?
        expect(@product.errors.full_messages).to include('Cost is invalid. Input half-width characters.')
      end
    end
  end
end
