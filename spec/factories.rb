FactoryGirl.define do
  factory :promotion do
    title { Faker::Lorem.words(5).join(" ") }
    tagline { Faker::Lorem.words(5).join(" ") }
    summary { Faker::Lorem.words(10).join(" ") }
    description { Faker::Lorem.paragraph(1) }
    image Rack::Test::UploadedFile.new(File.open(File.join(Rails.root, '/spec/fixtures/promotions/environ-peeling-kuur.jpg')))
    price 40.16
  end

  factory :treatment do
    title { Faker::Lorem.words(5).join(" ") }
    tagline { Faker::Lorem.words(5).join(" ") }
    summary { Faker::Lorem.words(10).join(" ") }
    description { Faker::Lorem.paragraph(2) }
    image Rack::Test::UploadedFile.new(File.open(File.join(Rails.root, '/spec/fixtures/treatments/gelaatsverzorging.jpg')))
    price 40.16
  end

  factory :user do
    name { Faker::Name.name }
    email { Faker::Internet.email }
    password '12345678'
  end

  factory :product do
    title { Faker::Lorem.words(5).join(" ") }
    description { Faker::Lorem.paragraph(2) }
    image Rack::Test::UploadedFile.new(File.open(File.join(Rails.root, '/spec/fixtures/products/jane-iredale-logo.jpg')))
  end

  factory :section do
    title { Faker::Lorem.words(5).join(" ") }
    description { Faker::Lorem.words(10).join(" ") }
    image Rack::Test::UploadedFile.new(File.open(File.join(Rails.root, '/spec/fixtures/sections/closed-eye.jpg')))
  end
end
