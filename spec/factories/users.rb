FactoryBot.define do
  factory :user do
    nickname           { Faker::Name.name }
    email              { Faker::Internet.free_email }
    password           { Faker::Internet.password(min_length: 6, mix_case: true) + "a0" }
    password_confirmation { password }
    last_name          { '大江' }
    first_name         { '真未子' }
    last_name_kana     { 'オオエ' }
    first_name_kana    { 'マミコ' }
    birth_date         { Faker::Date.between(from: '1930-01-01', to: '2017-12-31') }
  end
end
