FactoryBot.define do
  factory :product do
    name { "MyString" }
    price { 2 }
    description { "MyString" }
    user_id { 2 }
    brand_id { 2 }
    term_id { 2 }
    size_id { 2 }
    condition_id { 2 }
    shipping_id { 2 }
    delivery_id { 2 }
    fromprefecture_id { 2 }
    category_id { 2 }
  end
end
