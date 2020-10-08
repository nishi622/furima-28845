FactoryBot.define do
  factory :order_address do
    postal_code { '123-4567' }
    prefecture_id { 1 }
    city { '東京都' }
    banti { '1-1' }
    building_name { '東京ハイツ' }
    phone_number { '09012341234' }
    token {"tok_abcdefghijk00000000000000000"}
  end
end
