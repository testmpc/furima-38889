require 'rails_helper'

RSpec.describe OrderAddress, type: :model do
  before do
    @user = FactoryBot.create(:user)
    @item = FactoryBot.create(:item, user_id: @user.id)
    @order_address = FactoryBot.build(:order_address, user_id: @user.id, item_id: @item.id)
  end

  describe '商品購入機能' do
    context '商品購入できる場合' do
      it '全て入力すれば購入できる' do
        expect(@order_address).to be_valid
      end
      it '建物名がなくても購入できる' do
        @order_address.building = ''
        expect(@order_address).to be_valid
      end
    end
    context '商品購入できない場合' do
      it '郵便番号が空だと購入できない' do
        @order_address.post_code = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Post code can't be blank")
      end

      it '郵便番号が「3桁ハイフン4桁」の半角文字列以外だと購入できない' do
        @order_address.post_code = '1234567'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Post code is invalid. Include hyphen(-)")
      end

      it '都道府県に「---」が選択されていると購入できない' do
        @order_address.prefecture_id = 1
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Prefecture can't be blank")
      end

      it '市区町村が空だと購入できない' do
        @order_address.municipality = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Municipality can't be blank")
      end

      it '番地が空だと購入できない' do
        @order_address.block_number = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Block number can't be blank")
      end

      it '電話番号が空だと購入できない' do
        @order_address.tel_number = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Tel number can't be blank")
      end

      it '電話番号が9桁以下では購入できない' do
        @order_address.tel_number = '090123456'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Tel number is invalid. IInput using half-width numerical")
      end

      it '電話番号が12桁以上では購入できない' do
        @order_address.tel_number = '090123456789'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Tel number is invalid. IInput using half-width numerical")
      end

      it '電話番号に半角数字以外が含まれている場合は購入できない' do
        @order_address.tel_number = '090-1234-56'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Tel number is invalid. IInput using half-width numerical")
      end

      it 'クレジットのトークン情報がないと購入できない' do
        @order_address.token = nil
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Token can't be blank")
      end

      it 'userが紐付いていないと購入できない' do
        @order_address.user_id = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("User can't be blank")
      end

      it 'itemが紐付いていないと購入できない' do
        @order_address.item_id = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Item can't be blank")
      end
    end
  end
end
