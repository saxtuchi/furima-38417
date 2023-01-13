FactoryBot.define do
  factory :user do
    nickname              {Faker::Name.initials(number: 2)}
    email                 {Faker::Internet.free_email}
    password              {Faker::Internet.password(min_length: 6)}
    password_confirmation {password}
    last_name             {'m'}
    first_name            {'s'}
    last_name_kana        {'mm'}
    first_name_kana       {'ss'}
    birth_date            {'11111111'}
  end
end
