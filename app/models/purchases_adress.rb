class PurchasesAddress
  include ActiveModel::Model
  attr_accessor :post_code, :prefecture_id, :municipalities, :house_number, :building_name, :telephone_number,:item, :user_id

  with_options presence: true do
    validates :post_code, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"}
    validates :telephone_number, numericality: {only_integer: true, greater_than_or_equal_to: 10, less_than_or_equal_to: 11, message: 'is invalid'}
    validates :municipalities   
    validates :house_number  
    validates :user_id
  end

  
  validates :prefecture_id, numericality: {other_than: 0, message: "can't be blank"}

  def save
    # 購入情報を保存し、変数purchasesに代入する
    purchases = Purcases.create(item: item, user_id: user_id)
    # 住所を保存する
    # purchases_idには、変数purchasesのidと指定する
    Address.create(post_code: post_code, prefecture_id: prefecture_id, municipalities : municipalities , house_number: house_number, building_name: building_name, purchases_id: purchases.id)
  end
end
