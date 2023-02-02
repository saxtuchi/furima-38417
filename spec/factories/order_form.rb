FactoryBot.define do
  factory :order_form do
    postal_code { '000-0000' }
    prefecture_id { Faker::Number.between(from: 2, to: 48) }
    city { 'さいたま市' }
    addresses { '2-2' }
    building { '壱番館' }
    phone_number { '12345678998' }
    token { 'pk_test_1111111111111111' }
  end
end
