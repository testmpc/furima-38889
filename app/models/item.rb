class Item < ApplicationRecord
  belongs_to :user
  # has_one    :order, dependent: :destroy

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :situation
  belongs_to :shippingfee
  belongs_to :prefecture
  belongs_to :deliveryskd

  has_one_attached :image

  validates :name, presence: true
  validates :explanation, presence: true
  validates :price, presence: true
  validates :image, presence: true

  validates :category_id, numericality: { other_than: 1, message: "can't be blank" }
  validates :situation_id, numericality: { other_than: 1, message: "can't be blank" }
  validates :shippingfee_id, numericality: { other_than: 1, message: "can't be blank" }
  validates :prefecture_id, numericality: { other_than: 1, message: "can't be blank" }
  validates :deliveryskd_id, numericality: { other_than: 1, message: "can't be blank" }

  validates :price, numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999 },
                    format: { with: /\A[0-9]+\z/, message: 'Please enter in half-width digit number' }
end
