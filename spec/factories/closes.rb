FactoryBot.define do
  factory :close do
    not_available{1}
    association :user
    association :spot
  end
end