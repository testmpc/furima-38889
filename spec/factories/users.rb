FactoryBot.define do
  factory :user do
    email {Faker::Internet.free_email}
    # password {Faker::Internet.password(min_length: 6)}
    password { Faker::Lorem.characters(number: 6, min_alpha: 1, min_numeric: 1) }
    password_confirmation {password}
    nickname {Faker::Name.last_name}
    last_name { Gimei.name.last.kanji}
    first_name  { Gimei.name.first.kanji}
    last_furigana { Gimei.name.last.katakana}
    first_furigana { Gimei.name.first.katakana}
    date_of_birth {Faker::Date.birthday}
  end
end