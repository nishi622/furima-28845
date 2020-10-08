class OrderAddress

  include ActiveModel::Model
  attr_accessor :user_id, :item_id, :postal_code, :prefecture_id, :city, :banti, :building_name, :phone_number, :token

  validates :postal_code, :prefecture_id, :city, :banti, :phone_number, presence: true
  validates :postal_code, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"}
  validates :prefecture_id, numericality: { other_than: 0, message: "can't be blank" }
  validates :phone_number, format: {with: /\A\d{11}\z/}
  
  def save
    order = Order.create!(user_id: user_id, item_id: item_id)
    Address.create(postal_code: postal_code, prefecture_id: prefecture_id, city: city, banti: banti, building_name: building_name, phone_number: phone_number, order_id: order.id)
  end
end