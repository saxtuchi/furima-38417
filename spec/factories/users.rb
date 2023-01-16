FactoryBot.define do
  factory :user do
    nickname              {Faker::Name.initials(number: 2)}
    email                 {Faker::Internet.free_email}
    password              {'1a' + Faker::Internet.password(min_length: 6)}
    password_confirmation {password}
    last_name             {'ああ'}
    first_name            {'いい'}
    last_name_kana        {'アア'}
    first_name_kana       {'イイ'}
    birth_date            {'11111111'}
  end
end
