class OrderDelivery
  include ActiveModel::Model
    attr_accessor :postal_code, :prefecture_id, :city, :addresses, :building ,:phone_number ,:order

  validates :postal_code,    presence: true
  validates :postal_code,    format: { with: /\A\d{3}-\d{4}\z/ }, allow_blank: true

  validates :prefecture_id,  presence: true
  validates :prefecture_id,  numericality: { other_than: 1, message: "can't be blank" }, allow_blank: true

  validates :city,           presence: true
  validates :addresses,      presence: true
  # validates :building,       
  validates :phone_number,   presence: true
  validates :phone_number,   format: { with: /\A\d{11}\z/ }, allow_blank: true

  validates :order,          presence: true

  def save
    order = Order.create(user_id: user_id, item_id: item_id)
    Delivery.createcreate(postal_code: postal_code, prefecture_id: prefecture_id, city: city, adrreses: addresses, building: building, phone_number: phone_number, order_id: order.id)
  end
end