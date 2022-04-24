class OrderDelivery
  include ActiveModel::Model
  attr_accessor :postal_code, :prefecture_id, :city, :addresses, :building, :phone_number, :user_id, :item_id, :token

  validates :postal_code,    presence: true
  validates :postal_code,    format: { with: /\A\d{3}-\d{4}\z/, message: 'input correctly' }

  validates :prefecture_id,  presence: true
  validates :prefecture_id,  numericality: { other_than: 1, message: "can't be blank" }, allow_blank: true

  validates :city,           presence: true
  validates :addresses,      presence: true
  validates :phone_number,   presence: true
  validates :phone_number,   format: { with: /\A\d{10,11}\z/, message: 'input only number' }
  validates :token,          presence: true

  def save
    order = Order.create(user_id: user_id, item_id: item_id)
    Delivery.create(postal_code: postal_code, prefecture_id: prefecture_id, city: city, addresses: addresses, building: building,
                    phone_number: phone_number, order_id: order.id)
  end
end
