class Item < ApplicationRecord
  has_one_attached :image
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :situation
  belongs_to :delivery_charge
  belongs_to :delivery_area
  belongs_to :delivery_days
  has_one_attached :image

  validates :name, :version, :price, :image, presence: true

  validates :category_id, numericality: { other_than: 1, message: "を入力してください" }
  validates :situation_id, numericality: { other_than: 1, message: "を入力してください" }
  validates :delivery_charge_id, numericality: { other_than: 1, message: "を入力してください" }
  validates :delivery_area_id, numericality: { other_than: 1, message: "を入力してください" }
  validates :delivery_days_id, numericality: { other_than: 1, message: "を入力してください" }
  validates :price, numericality: { only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999 }

  belongs_to :user
  has_one :purchase
end
