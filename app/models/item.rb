class Item < ApplicationRecord
  belongs_to :user

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :status
  belongs_to :shopping_fee_status
  belongs_to :prefecture
  belongs_to :scheduled_delivery

  validates :name,                    presence: true

  validates :info,                    presence: true

  validates :category_id,             presence: true,
                                      numericality: { other_than: 1 , message: "can't be blank"}       
  
  validates :status_id,               presence: true,
                                      numericality: { other_than: 1 , message: "can't be blank"}

  validates :shopping_fee_status_id,  presence: true,
                                      numericality: { other_than: 1 , message: "can't be blank"}

  validates :prefecture_id,           presence: true,
                                      numericality: { other_than: 1 , message: "can't be blank"}

  validates :scheduled_delivery_id,   presence: true,
                                      numericality: { other_than: 1 , message: "can't be blank"}
                                                       
  validates :price,                   presence: true,
                                      numericality: { only_intenger: true, greater_than: 300, less_than: 9999999 }
  
  validates :user,                    presence: true
end