FactoryBot.define do
  factory :comment do
    text{Faker::Lorem.sentence(  random_words_to_add: 10)}
    association :user
    association :spot
  end
end
