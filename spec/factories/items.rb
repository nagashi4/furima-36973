FactoryBot.define do
  factory :item do
    name                 { 'テレビ' }
    version              { '新しい' }
    category_id          { '2' }
    situation_id         { '2' }
    delivery_charge_id   { '2' }
    delivery_area_id     { '2' }
    delivery_days_id { '2' }
    price { '10000' }

    association :user

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end
