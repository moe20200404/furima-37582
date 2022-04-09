class Item < ApplicationRecord
  belongs_to :user

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :status

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
                                                       
  validates :price,                   presence: true 
  validates :user,                    presence: true
end