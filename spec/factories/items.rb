FactoryBot.define do
  factory :item do
    name { 'テスト' }
    explanation { 'テストです。' }
    category_id { 2 }
    status_id { 2 }
    delivery_fee_id { 2 }
    delivery_area_id { 2 }
    delivery_day_id { 2 }
    price { 3000 }
    association :user

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_images.png'), filename: 'test_images.png')
    end
  end
end
