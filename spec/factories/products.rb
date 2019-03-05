FactoryBot.define do
  factory :product do
    name { "MyString" }
    description { "MyText" }
    part_number { "MyString" }
    image_url { "MyString" }
    price { 1.5 }
    category { "MyString" }
    brand { "MyString" }
  end
end
