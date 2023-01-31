require 'rails_helper'

RSpec.describe OrderForm, type: :model do
  before do
    @order = FactoryBot.build(:order_form)
  end

  describe '商品の購入' do
    context '商品の購入ができる場合' do
      it "全ての入力が必須" do
        expect(@order).to be_valid
      end
    end
    context '商品の購入ができない場合' do
      it "postal_codeが空では購入できない" do
        @order.postal_code = ''
        @order.valid?
        expect(@order.errors.full_messages).to include("Postal code can't be blank")
      end
      it "postal_codeが全角文字では購入できない" do
        @order.postal_code = '０００-００００'
        @order.valid?
        expect(@order.errors.full_messages).to include("Postal code 半角文字3桁-4桁で入力してください")
      end
      it "postal_codeが3桁-4桁以外の入力では購入できない" do
        @order.postal_code = '0000000'
        @order.valid?
        expect(@order.errors.full_messages).to include("Postal code 半角文字3桁-4桁で入力してください")
      end
      it "prefecture_idが空では購入できない" do
        @order.prefecture_id = ''
        @order.valid?
        expect(@order.errors.full_messages).to include("Prefecture can't be blank")
      end
      it "prefecture_idが1では購入できない" do
        @order.prefecture_id = 1
        @order.valid?
        expect(@order.errors.full_messages).to include("Prefecture can't be blank")
      end
      it "cityが空では購入できない" do
        @order.city = ''
        @order.valid?
        expect(@order.errors.full_messages).to include("City can't be blank")
      end
      it "addressesが空では購入できない" do
        @order.addresses = ''
        @order.valid?
        expect(@order.errors.full_messages).to include("Addresses can't be blank")
      end
      it "phone_numberが空では購入できない" do
        @order.phone_number = ''
        @order.valid?
        expect(@order.errors.full_messages).to include("Phone number can't be blank")
      end
      it "phone_numberが全角文字では購入できない" do
        @order.phone_number = '１2345678998'
        @order.valid?
        expect(@order.errors.full_messages).to include("Phone number 半角文字ハイフンなしで入力してください")
      end
      it "phone_numberが10桁未満では購入できない" do
        @order.phone_number = '12345'
        @order.valid?
        expect(@order.errors.full_messages).to include("Phone number 半角文字ハイフンなしで入力してください")
      end
      it "phone_numberが11桁以上では購入できない" do
        @order.phone_number = '12345671234567'
        @order.valid?
        expect(@order.errors.full_messages).to include("Phone number 半角文字ハイフンなしで入力してください")
      end
      it "tokenが空では購入できない" do
        @order.token = ''
        @order.valid?
        expect(@order.errors.full_messages).to include("Token can't be blank")
      end
    end
  end
end



