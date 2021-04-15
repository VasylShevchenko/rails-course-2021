FactoryBot.define do
  factory :user do
    email       { Faker::Internet.email }
    password    { Faker::Internet.password }
    age         { 30 }
    card_number { '4111111111111111' }
  end
end
