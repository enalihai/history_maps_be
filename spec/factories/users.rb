FactoryBot.define do
  factory :user do
    username { Faker::FunnyName.name }
    email { Faker::Internet.email}
  end
end
