class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :category
  belongs_to_active_hash :status
  belongs_to_active_hash :delivery_fee
  belongs_to_active_hash :delivery_area
  belongs_to_active_hash :delivery_day
  has_one_attached :image
  belongs_to :user
  has_many :orders

  validates :image, :name, :explanation, :category, :status, :delivery_fee, :delivery_area, :delivery_day, :price, presence: true
  validates :category_id, :status_id, :delivery_fee_id, :delivery_area_id, :delivery_day_id, numericality: { other_than: 1 }
  validates :price, numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999 }
  validates :price, format: { with: /\A[0-9]+\z/ }
end
