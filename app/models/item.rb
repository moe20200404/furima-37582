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

  validates :image,                   presence: true

  validates :name,                    presence: true

  validates :info,                    presence: true

  validates :category_id,             presence: true
  validates :category_id,             numericality: { other_than: 1, message: "can't be blank" }, allow_blank: true

  validates :status_id,               presence: true
  validates :status_id,               numericality: { other_than: 1, message: "can't be blank" }, allow_blank: true

  validates :shopping_fee_status_id,  presence: true
  validates :shopping_fee_status_id,  numericality: { other_than: 1, message: "can't be blank" }, allow_blank: true

  validates :prefecture_id,           presence: true
  validates :prefecture_id,           numericality: { other_than: 1, message: "can't be blank" }, allow_blank: true

  validates :scheduled_delivery_id,   presence: true
  validates :scheduled_delivery_id,   numericality: { other_than: 1, message: "can't be blank" }, allow_blank: true

  validates :price,                   presence: true
  validates :price,                   numericality: { only_intenger: true, greater_than: 300, less_than: 9_999_999 },
                                      allow_blank: true
end
