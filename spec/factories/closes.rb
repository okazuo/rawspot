FactoryBot.define do
  factory :close do
    association :user
    association :spot
  end
end