FactoryBot.define do
  factory :order do
    customer{Faker::Name.name}
    association :user
    association :spot
  end
end
