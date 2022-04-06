class Item < ApplicationRecord
  belongs_to :user

  validates :name,                    presence: true
  validates :info,                    presence: true
  validates :category_id,             presence: true       
  validates :status_id,               presence: true     
  validates :shopping_fee_status_id,  presence: true                  
  validates :prefecture_id,           presence: true         
  validates :scheduled_delivery_id,   presence: true                 
  validates :price,                   presence: true 
  validates :user,                    presence: true
end
