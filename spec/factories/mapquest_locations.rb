FactoryBot.define do
  factory :mapquest_location do
    street { Faker::Address.street_address }
    county { Faker::Address.county }
    city { Faker::Address.city }
    state { Faker::Address.state_abbr }
    zipcode { Faker::Address.zip_code }
  end
end
