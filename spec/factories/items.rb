FactoryBot.define do
  factory :item do
    name { Faker::Team.name }
    info { 'テスト' }
    category_id { Faker::Number.between(from: 2, to: 11) }
    sales_status_id { Faker::Number.between(from: 2, to: 7) }
    shipping_free_status_id { Faker::Number.between(from: 2, to: 3) }
    prefecture_id { Faker::Number.between(from: 2, to: 48) }
    scheduled_delivery_id { Faker::Number.between(from: 2, to: 4) }
    price { '1000' }
    association :user

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end
