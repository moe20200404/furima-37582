require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  describe '商品出品機能' do
    context '商品出品できるとき' do
      it '必要な情報を適切に入力して「出品する」ボタンを押すと、商品情報がデータベースに保存されること。' do
        expect(@item).to be_valid
      end
    end

    context '商品出品できないとき' do
      it 'imageがないと出品できない' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end
      it 'nameがないと出品できない' do
        @item.name = ""
        @item.valid?
        expect(@item.errors.full_messages).to include("Name can't be blank")
        end
      it 'infoがないと出品できない' do
        @item.info = ""
        @item.valid?
        expect(@item.errors.full_messages).to include("Info can't be blank")
      end
      it 'category_idがないと出品できない' do
        @item.category_id = ""
        @item.valid?
        expect(@item.errors.full_messages).to include("Category can't be blank")
      end
      it 'status_idがないと出品できない' do
        @item.status_id = ""
        @item.valid?
        expect(@item.errors.full_messages).to include("Status can't be blank")
      end
      it 'shopping_fee_status_idがないと出品できない' do
        @item.shopping_fee_status_id = ""
        @item.valid?
        expect(@item.errors.full_messages).to include("Shopping fee status can't be blank")
      end
      it 'prefecture_idがないと出品できない' do
        @item.prefecture_id = ""
        @item.valid?
        expect(@item.errors.full_messages).to include("Prefecture can't be blank")
      end
      it 'scheduled_delivery_idがないと出品できない' do
        @item.scheduled_delivery_id = ""
        @item.valid?
        expect(@item.errors.full_messages).to include("Scheduled delivery can't be blank")
      end
      it 'priceがないと出品できない' do
        @item.price = ""
        @item.valid?
        expect(@item.errors.full_messages).to include("Price can't be blank")
      end
      it 'priceは300より小さいと出品できない' do
        @item.price = 299
        @item.valid?
        expect(@item.errors.full_messages).to include("Price must be greater than 300")
      end
      it 'priceは9999999より大きいと出品できない' do
        @item.price =10000000
        @item.valid?
        expect(@item.errors.full_messages).to include("Price must be less than 9999999")
      end
      it 'priceは半角英字では出品できない' do
        @item.price = Faker::Lorem.word
        @item.valid?
        expect(@item.errors.full_messages).to include("Price is not a number")
      end
      it 'priceは全角数字では出品できない' do
        @item.price = "１２３４"
        @item.valid?
        expect(@item.errors.full_messages).to include("Price is not a number")
        end
        it 'priceは全角漢数字では保存できない' do
          @item.price = "一二三四"
          @item.valid?
        expect(@item.errors.full_messages).to include("Price is not a number")
        end
    end
  end
end
