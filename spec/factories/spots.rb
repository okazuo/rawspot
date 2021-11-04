FactoryBot.define do
  factory :spot do
    estate_agent {Faker::Company.name}
    address {Faker::Address.full_address}
    size {rand(0..9999)}
    price {rand(0..99999)}
    water_id {rand(2..5)}
    officialmap_id {rand(2..3)}
    transcript_id {rand(2..3)}
    contact_id {rand(2..3)}
    explanation {Faker::Lorem.paragraphs}
    association :user

    after(:build) do |spot|
      spot.image.attach(io:File.open('public/images/サンプル画像.jpeg'),filename: 'サンプル画像.jpeg')
    end
  end
end
