

FactoryBot.define do
  factory :user do
    name                  { 'test' }
    email                 { Faker::Internet.free_email }
    password              { Faker::Internet.password(min_length: 6) }
    password_confirmation { password }
    last_name_kanzi       { '田中' }
    first_name_kanzi      { '太郎' }
    last_name_kana        { 'タナカ' }
    first_name_kana       { 'タロウ' }
    birthday              { Faker::Date.birthday(min_age: 5, max_age: 90) }
  end
end
