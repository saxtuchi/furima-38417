class OrderForm
  include ActiveModel::Model
  attr_accessor :postal_code, :prefecture_id, :city, :addresses, :building, :phone_number, :user_id, :item_id
  with_options presence: true, format: { with: /\A\d{3}[-]\d{4}\z/, message: "半角文字を使用してください" } do
    validates :postal_code
  end
  validates :prefecture_id, numericality: { other_than: 1 , message: "can't be blank" }
  validates :city, presence: true
  validates :addresses, presence: true
  with_options presence: true, format: { with: /\A\d[0-9]{10,11}\z/, message: "半角文字を使用してください" } do
    validates :phone_number
  end

  def save
    order = Order.create(user_id: current_user.id, item_id: params[:item_id])
    Shipping.create(postal_code: postal_code, prefecture_id: prefecture_id, city: city, addresses: addresses, building: building, phone_number: phone_number, order_id: order.id)
  end
end