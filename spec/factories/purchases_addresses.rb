FactoryBot.define do
  factory :purchases_address do
    
        post_code { '123-4567' }
        delivery_area_id{ '2' }
        municipalities { '東京都' }
        house_number { '1-1' }
        building_name { '加藤ビル' }
        telephone_number { '1234567890' }  
        token {"tok_abcdefghijk00000000000000000"}
  end
end
