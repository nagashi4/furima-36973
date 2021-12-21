class Item < ApplicationRecord

  has_one_attached :image
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :situation
  belongs_to :delivery_charge_id
  belongs_to :dlivery_area_id
  belongs_to :delivery_days_id

  validates :name, :version, :price, presence: true

  validates :category_id, numericality: { other_than: 1 , message: "can't be blank"}
  validates :situation_id, numericality: { other_than: 1 , message: "can't be blank"}
  validates :delivery_charge_id, numericality: { other_than: 1 , message: "can't be blank"}
  validates :delivery_area_id, numericality: { other_than: 1 , message: "can't be blank"}
  validates :delivery_days_id, numericality: { other_than: 1 , message: "can't be blank"}

end
