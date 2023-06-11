class OrderAddress
  include ActiveModel::Model
  attr_accessor :post_code, :prefecture_id, :municipality, :block_number, :building, :tel_number, :user_id, :item_id

  with_options presence: true do
    validates :post_code, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"}
    validates :municipality
    validates :block_number
    validates :building
    validates :tel_number, format: {with: /\A[0-9]{10,11}\z/, message: "is invalid. IInput using half-width numerical"}
    validates :user_id
    validates :item_id
  end
  validates :prefecture_id, numericality: { other_than: 1, message: "can't be blank"}

  def save
    order = Order.create(user_id: user_id, item_id: item_id)
    Address.create(post_code: post_code, prefecture_id: prefecture_id, municipality: municipality, block_number: block_number, building: building, tel_number: tel_number, order_id: order.id)
  end
end