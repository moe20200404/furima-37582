class Item < ApplicationRecord
  belongs_to :user
  has_one :order
  has_one_attached :image

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :status
  belongs_to :shopping_fee_status
  belongs_to :prefecture
  belongs_to :scheduled_delivery

  with_options presence: true do
    validates :image
    validates :name
    validates :info
    validates :category_id,             numericality: { other_than: 1, message: "can't be blank" }, allow_blank: true
    validates :status_id,               numericality: { other_than: 1, message: "can't be blank" }, allow_blank: true
    validates :shopping_fee_status_id,  numericality: { other_than: 1, message: "can't be blank" }, allow_blank: true
    validates :prefecture_id,           numericality: { other_than: 1, message: "can't be blank" }, allow_blank: true
    validates :scheduled_delivery_id,   numericality: { other_than: 1, message: "can't be blank" }, allow_blank: true
    validates :price,                   numericality: { only_intenger: true, greater_than: 300, less_than: 9_999_999 }
  end
end
