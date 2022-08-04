FactoryBot.define do
  factory :favorite do
    association :user, factory: :user
    title { Faker::Address.full_address}
    image_full { Faker::Internet.url}
    short_id { Faker::Internet.url}
    published_date { Faker::Internet.email}
    creator { Faker::FunnyName.name}
    thumbnail { Faker::Internet.url}
  end
end