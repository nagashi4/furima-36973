class Item < ApplicationRecord

  has_one_attached :image
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :situation
  belongs_to :delivery_charge_id
  belongs_to :dlivery_area_id
  belongs_to :delivery_days_id
end
