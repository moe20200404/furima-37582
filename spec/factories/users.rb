FactoryBot.define do
  factory :user do

    nickname           {Faker::Name.name}
    email              {Faker::Internet.free_email}
    password           {"A1" + Faker::Internet.password(min_length: 4, mix_case: true)}
    password_confirmation  {password}
    last_name          {"大江"}
    first_name         {"真未子"}
    last_name_kana     {"オオエ"}
    first_name_kana    {"マミコ"}
    birth_date         {Faker::Date.between(from: '1930-1-1',to: '2017-12-31')}
  end
end