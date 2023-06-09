require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  describe '商品出品機能' do
    context '商品出品できる場合' do
      it '全て入力すれば登録できる' do
        expect(@item).to be_valid
      end
    end
    context '商品出品できない場合' do
      it '商品画像がないと登録できない' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end

      it '商品名が空だと登録できない' do
        @item.name = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Name can't be blank")
      end

      it '商品説明が空だと登録できない' do
        @item.explanation = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Explanation can't be blank")
      end

      it '商品カテゴリーが空だと登録できない' do
        @item.category = nil
        @item.valid?
        expect(@item.errors.full_messages).to include('Category is not a number')
      end
      it '商品カテゴリーが「---」だと登録できない' do
        @item.category = Category.first
        @item.valid?
        expect(@item.errors.full_messages).to include('Category must be other than 1')
      end

      it '商品の状態が空だと登録できない' do
        @item.situation = nil
        @item.valid?
        expect(@item.errors.full_messages).to include('Situation is not a number')
      end
      it '商品の状態が「---」だと登録できない' do
        @item.situation = Situation.first
        @item.valid?
        expect(@item.errors.full_messages).to include('Situation must be other than 1')
      end

      it '配送費の負担が空だと登録できない' do
        @item.shippingfee = nil
        @item.valid?
        expect(@item.errors.full_messages).to include('Shippingfee is not a number')
      end
      it '配送費の負担が「---」だと登録できない' do
        @item.shippingfee = Shippingfee.first
        @item.valid?
        expect(@item.errors.full_messages).to include('Shippingfee must be other than 1')
      end

      it '配送元の地域が空だと登録できない' do
        @item.prefecture = nil
        @item.valid?
        expect(@item.errors.full_messages).to include('Prefecture is not a number')
      end
      it '配送元の地域が「---」だと登録できない' do
        @item.prefecture = Prefecture.first
        @item.valid?
        expect(@item.errors.full_messages).to include('Prefecture must be other than 1')
      end

      it '配送までの日数が空だと登録できない' do
        @item.deliveryskd = nil
        @item.valid?
        expect(@item.errors.full_messages).to include('Deliveryskd is not a number')
      end
      it '配送までの日数が「---」だと登録できない' do
        @item.deliveryskd = Deliveryskd.first
        @item.valid?
        expect(@item.errors.full_messages).to include('Deliveryskd must be other than 1')
      end

      it '商品価格が空だと登録できない' do
        @item.price = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Price can't be blank")
      end

      it '商品価格は¥300~でないと登録できない' do
        @item.price = '0'
        @item.valid?
        expect(@item.errors.full_messages).to include('Price must be greater than or equal to 300')
      end

      it '商品価格は~¥9,999,999でないと登録できない' do
        @item.price = '10000000'
        @item.valid?
        expect(@item.errors.full_messages).to include('Price must be less than or equal to 9999999')
      end

      it '商品価格は半角数値でないと登録できない' do
        @item.price = '１０００'
        @item.valid?
        expect(@item.errors.full_messages).to include('Price is not a number')
      end

      it 'ユーザー情報と紐づいていないと登録できない' do
        @item.user = nil
        @item.valid?
        expect(@item.errors.full_messages).to include('User must exist')
      end
    end
  end
end
