require 'rails_helper'

RSpec.describe OrderDelivery, type: :model do
  before do
    @user = FactoryBot.create(:user)
    @item = FactoryBot.create(:item)
    @order_delivery = FactoryBot.build(:order_delivery, user_id: @user.id, item_id: @item.id)
    sleep 0.1
  end
  context '配送先情報が保存できるとき' do
    it '配送先情報が正しく入力されていれば、保存できる' do
      expect(@order_delivery).to be_valid
    end
    it '配送先情報のうち、建物情報だけはなくても保存できる' do
      @order_delivery.building = ""
      expect(@order_delivery).to be_valid
    end
  end
  context '配送先情報が保存できないとき' do
    it '郵便番号がないと保存できない' do
      @order_delivery.postal_code = ""
      @order_delivery.valid?
      expect(@order_delivery.errors.full_messages).to include("Postal code can't be blank")
    end
    it '郵便番号は、「3桁ハイフン4桁」の半角文字列でないと保存できない（良い例：123-4567　良くない例：1234567）。' do
      @order_delivery.postal_code = 1234567
      @order_delivery.valid?
      expect(@order_delivery.errors.full_messages).to include("Postal code input correctly")
    end
    it '都道府県がないと保存できない' do
      @order_delivery.prefecture_id = 1
      @order_delivery.valid?
      expect(@order_delivery.errors.full_messages).to include("Prefecture can't be blank")
    end
    it '市区町村がないと保存できない' do
      @order_delivery.city = ""
      @order_delivery.valid?
      expect(@order_delivery.errors.full_messages).to include("City can't be blank")
    end
    it '番地がないと保存できない' do
      @order_delivery.addresses = ""
      @order_delivery.valid?
      expect(@order_delivery.errors.full_messages).to include("Addresses can't be blank")
    end
    it '電話番号がないと保存できない' do
      @order_delivery.phone_number = ""
      @order_delivery.valid?
      expect(@order_delivery.errors.full_messages).to include("Phone number can't be blank")
    end
    it '電話番号は、10桁以上11桁以内の半角数値でないと保存できない（良い例：09012345678　良くない例：090-1234-5678）。' do
      @order_delivery.phone_number = "090-1234-5678"
      @order_delivery.valid?
      expect(@order_delivery.errors.full_messages).to include("Phone number input only number")
    end
  end
end
