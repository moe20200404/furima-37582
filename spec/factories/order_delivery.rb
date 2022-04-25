FactoryBot.define do
  factory :order_delivery do
    postal_code {Faker::Number.leading_zero_number(digits: 3) + '-' + Faker::Number.leading_zero_number(digits: 4)}
    prefecture_id  { Faker::Number.between(from: 2, to: 49) }
    city           { Faker::Lorem.word }
    addresses      { Faker::Lorem.word }
    building       { Faker::Lorem.word }
    phone_number   { Faker::Number.number(digits: 11) }
    token          { 'tok_abcdefghijk00000000000000000' }
  end
end
