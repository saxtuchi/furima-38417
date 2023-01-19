FactoryBot.define do
  factory :item do
    name {Faker::Team.name}
    info {'テスト'}
    category {Category.all.sample}
    sales_status {SalesStatus.all.sample}
    shipping_free_status {ShippingFreeStatus.all.sample}
    prefecture {Prefecture.all.sample}
    scheduled_delivery {ScheduledDelivery.all.sample}
    price {'1000'}
    association :user 
  
    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end
