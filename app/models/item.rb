class Item < ApplicationRecord
  belongs_to :user
  # has_one    :order, dependent: :destroy

  has_one_attached :image

  validates :name, presence: true
  validates :explanation, presence: true
  validates :category_id, presence: true
  validates :situation_id, presence: true
  validates :delivery_charge_id, presence: true
  validates :region_of_origin_id, presence: true
  validates :days_to_ship_id, presence: true
  validates :price, presence: true
  validates :image, presence: true
end