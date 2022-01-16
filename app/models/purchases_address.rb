class PurchasesAddress
  include ActiveModel::Model
  attr_accessor :post_code, :delivery_area_id, :municipalities, :house_number, :building_name, :telephone_number, :item_id,
                :user_id, :token

  with_options presence: true do
    validates :post_code, format: { with: /\A[0-9]{3}-[0-9]{4}\z/, message: 'is invalid. Include hyphen(-)' }
    validates :telephone_number, format: { with: /\A\d{10,11}\z/ }
    validates :municipalities
    validates :house_number
    validates :user_id
    validates :delivery_area_id, numericality: { other_than: 1, message: "can't be blank" }
    validates :token
    validates :item_id

  end

  validates :delivery_area_id, numericality: { other_than: 0, message: "can't be blank" }

  def save
    # 購入情報を保存し、変数purchasesに代入する
    purchase = Purchase.create(item_id: item_id, user_id: user_id)
    # 住所を保存する
    # purchases_idには、変数purchasesのidと指定する
    Address.create(post_code: post_code, delivery_area_id: delivery_area_id, municipalities: municipalities,
                   house_number: house_number, building_name: building_name, telephone_number: telephone_number, purchase_id: purchase.id)
  end
end
