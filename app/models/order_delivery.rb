class OrderDelivery
  include ActiveModel::Model
  attr_accessor :postal_code, :prefecture_id, :city, :addresses, :building, :phone_number, :user_id, :item_id, :token

  with_options presence: true do
    validates :postal_code,    format: { with: /\A\d{3}-\d{4}\z/, message: 'input correctly' }
    validates :prefecture_id,  numericality: { other_than: 1, message: "can't be blank" }, allow_blank: true
    validates :city
    validates :addresses
    validates :phone_number,   length: { within: 10..11 },
                               format: { with: /\A\d{10,11}\z/, message: 'input only number' }
    validates :token
    validates :user_id
    validates :item_id
  end

  def save
    order = Order.create(user_id: user_id, item_id: item_id)
    Delivery.create(postal_code: postal_code, prefecture_id: prefecture_id, city: city, addresses: addresses, building: building,
                    phone_number: phone_number, order_id: order.id)
  end
end
