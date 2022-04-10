# require 'rails_helper'

# RSpec.describe "商品出品機能", type: :system do
#   before do
#     @item = FactoryBot.build(:item)
#     @item.user.save
#   end

#   # context '商品出品できないとき' do
#     # it 'ログアウト状態で商品出品ページへ遷移しようとすると、ログインページへ遷移すること' do
#     #   # Basic認証を行う
#     #   basic_pass(root_path)
#     #   # ログアウト状態で商品出品ページへ遷移しようとすると、ログインページへ遷移すること
#     #   visit new_item_path
#     #   expect(current_path).to eq new_user_session_path
#     # end
#   # end
#   context '商品出品できるとき' do
#     it '必要な情報を適切に入力して「出品する」ボタンを押すと、商品情報がデータベースに保存されること。' do
#       # Basic認証を行う
#       basic_pass(root_path)
#       # ログインする
#       sign_in(@item.user)
#       # 商品出品ページに遷移する
#       visit new_item_path
#       # 必要な情報を適切に入力する
#       attach_file('item[image]', 'public/images/test_image.jpeg')
#       fill_in 'item-name',with: @item.name
#       fill_in 'item-info',with: @item.info
#       select(@item.category_id.to_s, from: 'item-category')

#       # select(@user.birth_date.year.to_s, from: 'user[birth_date(1i)]')


#       select(@item.status_id.to_s, from: 'item[status_id]')
#       binding.pry
#       select(@item.shopping_fee_status_id.to_s, from: 'item[shopping_fee_status_id]')
#       select(@item.prefecture_id.to_s, from: 'item[prefecture_id]')
#       select(@item.scheduled_delivery_id.to_s, from: 'item[scheduled_delivery_id]')
#       fill_in 'item-price',with: @item.price
#       # 「出品する」ボタンを押すと、商品情報がデータベースに保存される
#       expect{
#         find(input[name="commit"]).click
#       }.to change{Item.count}.by(1)
#     end

#     it '入力された価格によって、販売手数料や販売利益の表示が変わること。' do
#     end
#     it '販売手数料と販売利益は、小数点以下を切り捨てて表示すること。' do

#     end


#   end
# end
