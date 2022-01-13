class Purchase < ApplicationRecord
  has_one :address
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :prefecture
end
