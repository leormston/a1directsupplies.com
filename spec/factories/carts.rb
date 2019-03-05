FactoryBot.define do
  factory :cart do
    quantity { 1.5 }
    product_id { 1 }
    user_id { 1 }
  end
end
