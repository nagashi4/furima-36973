FactoryBot.define do
  factory :user do
    nickname              {'test'}
    email                 {'test@example'}
    password               {Faker::Internet.password(min_length: 6)}
    password_confirmation {password}
    last_name             {'佐藤'}
    first_name            {'一郎'}
    last_name_kana        {'サトウ'}
    first_name_kana       {'イチロウ'}
    birth_day             {'1960-06-11'}
  end
end